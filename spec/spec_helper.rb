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
    add_group "Apps", "apps"
    add_group "Web", "apps/web"
    add_group "Admin", "apps/admin"
    add_group "Entities", "lib/quizzy/entities"
    add_group "Repositories", "lib/quizzy/repositories"
  end
end

require_relative "../config/environment"
require "minitest/autorun"

Lotus::Application.preload!
