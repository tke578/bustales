require 'rubygems'
require 'sinatra'
require 'rest-client'
require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end


enable :sessions

CALLBACK_URL = "http://localhost:4567/oauth/callback"
CLIENT_ID = ENV['CLIENT_ID']
CLIENT_SECRET = ENV['CLIENT_SECRET']


get '/' do
	link = "https://api.instagram.com/oauth/authorize/?client_id=#{CLIENT_ID}&redirect_uri=#{CALLBACK_URL}&response_type=code"
  "<a href=#{link}>Connect with Instagram</a>"
end

get "/oauth/callback" do
	raise
  
end