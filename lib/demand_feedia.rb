require 'grape'

class DemandFeedia < Grape::API
  resource :messages do
    get :hello do
      "hello"
    end

    get '/hello/:entity' do
      "Hello, #{params[:entity]}"
    end
  end
  
end