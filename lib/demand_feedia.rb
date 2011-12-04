require 'grape'
require 'http'
require 'json'


class DemandFeedia < Grape::API
  resource :messages do
    get :hello do
      HTTP.get 'http://api.nytimes.com/svc/search/v1/article?format=json&query=steven+spielberg+fee%3A%22Y%22&begin_date=19810101&end_date=20120101&rank=newest&api-key=3761c354783251ab639777f67fdcae98:5:65301959'
    end

    # get '/hello/:entity' do
    #   "Hello, #{params[:entity]}"
    # end
  end
  
end