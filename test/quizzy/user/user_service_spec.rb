require "test_helper"
require "quizzy/user/user_service"
require "quizzy/user/user"

module Quizzy::User
  describe UserService do
    let(:repository) { stub }
    let(:service) { UserService.new(repository) }

    describe "#find_or_create_by_oauth" do

      it "returns the user" do
        user = User.new
        oauth = mock(uid: "123", provider: "google")
        repository.expects(:find_one_by).with({ uid: "123", provider: "google" }).returns(user)

        returned = service.find_or_create_by_oauth(oauth)

        returned.must_be_same_as(user)
      end

      it "creates a new user when" do
        user = User.new

        data = {
          uid: "123",
          provider: "google",
          email: "google",
          name: "name",
          email: "email",
          provider_data: "",
        }

        oauth = stub(data)

        repository.expects(:find_one_by).
          with(uid: "123", provider: "google").returns(nil)

        repository.expects(:create).with(user) do |value|
          value.is_a?(User)
        end

        created_user = service.find_or_create_by_oauth(oauth)

        created_user.provider.must_equal data[:provider]
        created_user.uid.must_equal data[:uid]
        created_user.provider_data.must_equal data[:provider_data]
        created_user.name.must_equal data[:name]
        created_user.email.must_equal data[:email]
        created_user.created_at.to_s.must_equal Time.now.utc.to_s
        created_user.updated_at.to_s.must_equal Time.now.utc.to_s
      end
    end
  end
end
