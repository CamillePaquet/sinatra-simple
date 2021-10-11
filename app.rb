require 'rubygems'
require 'sinatra'
require 'mongoid'

class Sample < Sinatra::Base

  configure do
    Mongoid.configure do |config|
      name = "mongoid_dev"
      host = "192.168.1.10"
    end
  end

  get '/' do
    User.create(
      :name => 'camille',
      :surname => 'paquet',
      :password => 'test'
    )
    erb :index
  end

end
