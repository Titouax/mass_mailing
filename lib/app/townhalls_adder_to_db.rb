require 'rubygems'
require 'twitter'
require "google_drive"
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'dotenv'
require 'pry'
require "csv"

# Ceci appelle le fichier .env grâce à la gem dotenv, et enregistre toutes les données enregistrées dans une hash ENV
Dotenv.load
#récupérer les handles twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['twitter_key']
  config.consumer_secret = ENV['twitter_secret']
  config.access_token = ENV['twitter_access_token']
  config.access_token_secret = ENV['twitter_access_token_secret']
end

@client = client

CSV.foreach("/home/lut/Documents/THP/mass_mailing/lib/app/townhalls.csv") do |row|
		 users = []
		   if @client.user_search(row)[0] == nil
		     users << " "
		   else
		     users << @client.user_search(row)[0]
		 end
		end

		 @users = users
		p users
