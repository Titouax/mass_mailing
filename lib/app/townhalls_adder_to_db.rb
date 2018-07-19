require 'rubygems'
require 'twitter'
require "google_drive"
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'dotenv'
require 'pry'

# Ceci appelle le fichier .env grâce à la gem dotenv, et enregistre toutes les données enregistrées dans une hash ENV
Dotenv.load

#récupérer les handles twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['twitter_api_key']
  config.consumer_secret     = ENV['twitter_api_secret']
  config.access_token        = ENV['twitter_token']
  config.access_token_secret = ENV['twitter_token_secret']
end

# input all the names here or grab them from your database or somewhere else.
#session = GoogleDrive::Session.from_config("config.json")
#ws = session.spreadsheet_by_key("152JmKSteBTvUSA-wCTgWbO0wNVw_I6R1BARfBuWh9vM").worksheets[0]

begin
  names = ['Dennis Paagman', 'Springest', 'Github']

  names.each do |name|

  @twitter = client.user_search(name)
  twitter_user = @twitter.first
  puts "#{twitter_user[:name]}: #{twitter_user[:screen_name]}"
        # Save your data here, write it to a database or something
  end

rescue Twitter::Error::BadRequest => e
    puts "Hit rate limit."
    sleep retry_after(e)
 retry

rescue Twitter::Error::Unauthorized
    puts "Not authorized. Please check the Twitter credentials at the top of the script."

#  rescue Exception => e
#    puts "Something else went wrong:"
#    puts e.message

end
