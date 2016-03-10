ENV['RACK_ENV'] = 'test'

require 'minitest/pride'
require 'minitest/benchmark'
require 'rack/test'
require_relative '../test.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end
