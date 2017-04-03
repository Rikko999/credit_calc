require 'sinatra/base'
require './lib/calculator'
require './helpers/format_helper'

class MyApp < Sinatra::Base
  helpers FormatHelper

  get '/' do
    erb :index
  end

  post '/result' do
    @result = Calculator.new(params)
    @result.run
    erb :show
  end

  run! if app_file == $PROGRAM_NAME
end
