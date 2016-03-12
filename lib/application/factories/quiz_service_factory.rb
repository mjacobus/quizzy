module Application
  module Factories
    class QuizServiceFactory
      def create_service(dependencies)
        repository = dependencies.get(Quizzy::Infrastructure::QuizRepository)
        Quizzy::Quiz::QuizService.new(repository)
      end
    end
  end
end
