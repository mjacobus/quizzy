ENV["LOTUS_ENV"] ||= "development"

app_path = File.expand_path("../..", __FILE__)
$LOAD_PATH.unshift(app_path) unless $LOAD_PATH.include?(app_path)

require "config/environment"
Lotus::Application.preload!
require "spec/support/fixtures"

dependencies    = Application::Dependencies.instance
user_repository = dependencies.fetch("Quizzy::User::UserRepository")
fixtures        = Fixtures.new

fixtures.create_user

user_repository.find_all_by({}).each do |user|
  (1..10).each do
    fixtures.create_quiz(user_id: user.id)
  end
end
