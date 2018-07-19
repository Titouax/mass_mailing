require 'twitter'
require 'dotenv'

Dotenv.load
=begin  CSV to extract one column
col_data = []
CSV.foreach(FILENAME) {|row| col_data << row[COL_INDEX]} or
@dataTable = CSV.table('path_to_csv.csv')
@dataTable[:columnname]

=end
def client

  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['twitter_api_key']
    config.consumer_secret     = ENV['twitter_api_secret']
    config.access_token        = ENV['twitter_token']
    config.access_token_secret = ENV['twitter_token_secret']
end
@name = params[:name]
user = twitter_client.user_search(@name).first
if user
   @full_name = user.name
   @created_at = user.created_at
   @user_id = user.id
else
   # do something else
end
