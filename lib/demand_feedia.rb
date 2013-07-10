require 'sinatra'
require "sinatra/json"

require "typhoeus"

require 'json'
require 'cgi'

set :json_encoder, :to_json

get '/articles/about/:terms/around/:year' do
  year = params[:year].to_i
  begin_date = "#{year - 1}0701"
  end_date   = "#{year + 1}0631"
  url = 'http://api.nytimes.com/svc/search/v1/article?format=json' +
    '&query=' + params[:terms] +
    '+fee%3A%22Y%22&' +
    "begin_date=#{begin_date}&" +
    "end_date=#{end_date}&" +
    'rank=closest&' +
    # 'fields=small_image_url%2Csmall_image%2Cbody%2Ctitle%2Curl&' +
    'api-key=3761c354783251ab639777f67fdcae98:5:65301959'

  result = Typhoeus.get url
  json = result.response_body
  articles = JSON.parse(json)["results"]

  articles.each do |a|
    escaped_url = CGI.escape(a['url'])
    buy_link = 
      'https://myaccount.nytimes.com/mem/purchase/gateway/checkout.html?url=' +
      escaped_url + '&refType=archive&OC=100101'
    a[:buy_link] = buy_link
  end

  buy_bundle_link =
    if articles.count == 10
      articles.first[:buy_link].sub('100101', '100102')
    else
      nil
    end

  json({ articles: articles, buy_bundle_link: buy_bundle_link})
end
