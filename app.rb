require 'rubygems'
require 'sinatra'
require 'rest-client'

enable :sessions

CALLBACK_URL = "http://localhost:4567/oauth/callback"
CLIENT_ID = ENV['CLIENT_ID']
CLIENT_SECRET = ENV['CLIENT_SECRET']


get '/' do

  '<a href="https://api.instagram.com/oauth/authorize/?client_id=<%= CLIENT_ID %>&redirect_uri=<%= CALLBACK_URL %>&response_type=code">Connect with Instagram</a>'
end

get "/oauth/connect" do
	raise
  
end