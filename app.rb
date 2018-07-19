require "bundler"
Bundler.require
$:.unshift File.expand_path("./../lib", __dir__)
$:.unshift File.expand_path('./../db', __dir__)
$:.unshift File.expand_path('lib/views', __dir__)
Dotenv.load
require_relative "./lib/views/index.rb"
require_relative "./lib/views/done.rb"
require_relative './lib/app/townhalls_mailer'
require_relative "./lib/app/townhalls_scrapper.rb"

Menu.new
