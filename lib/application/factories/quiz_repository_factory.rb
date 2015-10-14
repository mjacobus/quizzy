module Application
  module Factories
    class QuizRepositoryFactory
      def create_service(dependencies)
        adapter = Koine::Repository::Persistence::Adapter::Sql.new(
          dependencies.get(:db_connection),
          :quizzes
        )
        repository = Quizzy::Repositories::QuizRepository.new(adapter)
        repository.hydrator         = Koine::Hydrator::Hydrator.new
        repository.entity_prototype = Quizzy::Entities::Quiz.new
        repository
      end
    end
  end
end
