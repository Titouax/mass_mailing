require 'twitter'
require 'dotenv'
require 'csv'
require 'pry'

Dotenv.load

class Follower
  attr_accessor :client, :users

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "7C9PamNrotofDGwl8Ak4i9tPF"
      config.consumer_secret     = "vQu2Skqnbvc6A8jLoazaFg6wnB3Lg6UsmP4hs1cmf6WGSeoCxB"
      config.access_token        = "1016995756220264448-1Rk7FtnkOBAXBfIwcRUYy4bTeGPiaI"
      config.access_token_secret = "mBv39r6PV3aizklCW12Of5vswJ3XXyyQcwkM3RLuoEX8O"
    end
    @users = []
    follow_accounts(search_accounts)
  end

  def search_accounts
    puts "search accounts"
    names = CSV.foreach('../../db/townhalls.csv') {|row| return row[0]}
    users = []
    names.each do |name|
      if @client.user_search(name)[0] == nil
        users << " "
      else
        users << @client.user_search(name)[0]
      end
    end
    @users = users
    col_data = []
    @dataTable = CSV.table('../../db/townhalls.csv')
    CSV.foreach('../../db/townhalls.csv') {|row|
      @dataTable << @users.row[2]

    }

  end

  def follow_accounts(users) #follow les differents comptes Twitter
    puts "follow accounts"
    @users.each do |user|
      @client.follow(user)
    end
  end
end

Follower.new
