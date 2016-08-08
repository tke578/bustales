require 'rubygems'
require 'sinatra'
require 'rest-client'
require 'better_errors'
require "net/http"
require "uri"
require "sinatra/activerecord"
require "tux"

class User < ActiveRecord::Base
end


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

set :database_file, "config/database.yml"


enable :sessions

CALLBACK_URL = "http://localhost:4567/oauth/callback"
CLIENT_ID = ENV['CLIENT_ID']
CLIENT_SECRET = ENV['CLIENT_SECRET']


get '/' do
	link = "https://api.instagram.com/oauth/authorize/?client_id=#{CLIENT_ID}&redirect_uri=#{CALLBACK_URL}&response_type=code"
  "<a href=#{link}>Connect with Instagram</a>"
end

get "/oauth/callback" do
	if params[:code]
		uri = URI.parse("https://api.instagram.com")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Post.new("/oauth/access_token")
		request.set_form_data({"client_id" => CLIENT_ID, "client_secret" => CLIENT_SECRET, "grant_type" => "authorization_code", "redirect_uri" => CALLBACK_URL, "code" => params[:code]})
		response = http.request(request)
		response_body= JSON.parse(response.body)
		raise

		RestClient.get 'https://api.instagram.com/v1/users/self/media/recent/', {:params => {'access_token' => response_body["access_token"]}}
	end


	
  
end