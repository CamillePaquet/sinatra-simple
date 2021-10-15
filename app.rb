require 'rubygems'
require 'sinatra'
require 'mongoid'
require_relative 'models/init'
Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))
class Sample < Sinatra::Base

  set :port, 9292
  set :bind, '0.0.0.0'

  get '/' do
    User.create(
      :name => 'camille',
      :surname => 'paquet',
      :password => 'test'
    )
    erb :index
  end

end
