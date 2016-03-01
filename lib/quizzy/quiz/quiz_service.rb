module Quizzy
  module Quiz
    class QuizService
      def initialize(repository)
        @repository = repository
      end

      def all
        repository.find_all_by({})
      end

      def create(service)
        repository.create(service)
      end

      private

      attr_reader :repository
    end
  end
end
