module Application
  module Factories
    class QuizServiceFactory
      def create_service(dependencies)
        repository = dependencies.get(Quizzy::Repositories::QuizRepository)
        Quizzy::Services::QuizService.new(repository)
      end
    end
  end
end
