# Require this file for unit tests
ENV["LOTUS_ENV"] ||= "test"

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
    add_group "Lib", "lib"
    add_group "Quizzy", "lib/quizzy"
    add_group "Web", "apps/web"
  end
end

require_relative "../config/environment"
require "minitest/autorun"
require 'minitest/unit'
require 'mocha/mini_test'

Lotus::Application.preload!

