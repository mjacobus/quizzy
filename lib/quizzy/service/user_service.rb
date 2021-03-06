module Quizzy
  module Service
    class UserService
      def initialize(repository)
        @repository = repository
      end

      def find_or_create_by_oauth(oauth)
        user = repository.find_one_by(provider: oauth.provider, uid: oauth.uid)
        return user if user
        create_user_by_oauth(oauth)
      end

      private

      def create_user_by_oauth(oauth)
        user               = Quizzy::Domain::User.new
        user.provider_data = oauth.provider_data
        user.provider      = oauth.provider
        user.uid           = oauth.uid
        user.name          = oauth.name
        user.email         = oauth.email
        user.created_at    = Time.new.utc
        user.updated_at    = Time.new.utc

        repository.create(user)

        user
      end

      attr_reader :repository

    end
  end
end
