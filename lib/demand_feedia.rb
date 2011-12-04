require 'grape'
require 'http'
require 'json'

class DemandFeedia < Grape::API
  resource :articles do
    get '/about/:terms/around/:year' do
      year = params[:year].to_i
      begin_date = "#{year - 1}0701"
      end_date   = "#{year + 1}0631"
      HTTP.get 'http://api.nytimes.com/svc/search/v1/article?format=json' +
        '&query=' + params[:terms] +
        '+fee%3A%22Y%22&' +
        "begin_date=#{begin_date}&" +
        "end_date=#{end_date}&" +
        'rank=closest&' +
        'api-key=3761c354783251ab639777f67fdcae98:5:65301959'
    end
  end
  
end