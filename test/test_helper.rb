ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

if ENV["COVERALLS"]
  require "coveralls"
  Coveralls.wear!
end

if ENV["SCRUTINIZER"]
  require "scrutinizer/ocular"
  Scrutinizer::Ocular.watch!
end

if ENV["COVERAGE"]
  require "simplecov"

  SimpleCov.start do
    add_filter "/spec/"
    add_filter "/test/"
    add_group "Lib", "lib"
    add_group "Quizzy", "lib/quizzy"
  end
end

require "minitest/autorun"
# require 'minitest/unit'
require 'mocha/mini_test'
