require "bundler"
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)

require "./lib/views/index.rb"
require "./lib/views/done.rb"
