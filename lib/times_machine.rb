require "pry"
require 'sinatra'
require "sinatra/json"
require "sinatra/jsonp"

require 'json'
require 'cgi'

require "nytimes_articles"

include Nytimes::Articles
Base.api_key =  "3761c354783251ab639777f67fdcae98:5:65301959"

set :json_encoder, :to_json

get '/articles/about/:terms/around/:year' do
  year = params[:year].to_i
  begin_date = "#{year - 1}0701"
  end_date   = "#{year + 1}0631"

  result = Article.search(
    "#{params[:terms]} +fee:Y",
    begin_date: begin_date, end_date: end_date, rank: :closest
  )

  articles = []
  result.each do |article|
    escaped_url = CGI.escape(article.url)
    buy_link =
      'https://myaccount.nytimes.com/mem/purchase/gateway/checkout.html?url=' +
      escaped_url + '&refType=archive&OC=100101'
    articles << {buy_link: buy_link, title: article.title, body: article.body, byline: article.byline, url: article.url}
  end

  buy_bundle_link =
    if articles.count == 10
      articles.first[:buy_link].sub('100101', '100102')
    else
      nil
    end

  jsonp({ articles: articles, buy_bundle_link: buy_bundle_link})
end
