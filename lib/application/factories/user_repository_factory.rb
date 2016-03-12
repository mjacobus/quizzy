module Application
  module Factories
    class UserRepositoryFactory
      def create_service(dependencies)
        adapter = Koine::Repository::Persistence::Adapter::Sql.new(
          dependencies.get(:db_connection),
          :users
        )
        repository = Quizzy::Infrastructure::UserRepository.new(adapter)
        repository.hydrator         = Koine::Hydrator::Hydrator.new
        repository.entity_prototype = Quizzy::Domain::User.new
        repository
      end
    end
  end
end
