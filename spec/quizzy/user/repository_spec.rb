require "spec_helper"
require "quizzy/user/user_repository"
require "support/test_db"

module Quizzy::User
  describe UserRepository do
    let(:repository) { TestDb.instance.repository(UserRepository) }

    describe "#create" do
      it "creates a user" do
        TestDb.inside_transaction do
          entity = User.new

          entity.uid = "uid"
          entity.provider = "google"
          entity.name = "Foo Bar"
          entity.email = "some@email.com"
          entity.created_at = Time.now.utc
          entity.updated_at = Time.now.utc
          entity.provider_data = {}.to_json

          repository.create(entity)
          repository.find_all_by({}).size.must_equal 1

          reloaded = repository.find(entity.id)

          entity.uid.must_equal reloaded.uid
          entity.provider.must_equal reloaded.provider
          entity.name.must_equal reloaded.name
          entity.email.must_equal reloaded.email
          entity.provider_data.must_equal reloaded.provider_data

          entity.created_at.to_s.must_equal Time.now.utc.to_s
          entity.updated_at.to_s.must_equal Time.now.utc.to_s
        end
      end
    end
  end
end
