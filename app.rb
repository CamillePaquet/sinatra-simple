require 'rubygems'
require 'sinatra'
require 'mongoid'
require_relative 'models'
Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))
class Sample < Sinatra::Base

  get '/' do
    User.create(
      :name => 'camille',
      :surname => 'paquet',
      :password => 'test'
    )
    erb :index
  end

end
