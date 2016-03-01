# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require "./test/support/fixtures"

dependencies    = Application::Dependencies.instance
user_repository = dependencies.fetch("Quizzy::User::UserRepository")
fixtures        = Fixtures.new

fixtures.create_user

user_repository.find_all_by({}).each do |user|
  (1..10).each do
    fixtures.create_quiz(user_id: user.id)
  end
end
