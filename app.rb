require 'rubygems'
require 'sinatra'
require 'mongoid'

class Sample < Sinatra::Base

  configure do
    Mongoid.configure do |config|
      name = "mongoid_dev"
      host = "localhost"
      config.master = Mongo::Connection.new.db(name)
    end
  end

  get '/' do
    erb :index
  end

end
