module Application
  module Factories
    class UserRepositoryFactory
      def create_service(dependencies)
        adapter = Koine::Repository::Persistence::Adapter::Sql.new(
          dependencies.get(:db_connection),
          :users
        )
        repository = Quizzy::User::UserRepository.new(adapter)
        repository.hydrator         = Koine::Hydrator::Hydrator.new
        repository.entity_prototype = Quizzy::User::User.new
        repository
      end
    end
  end
end
