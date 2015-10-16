module Quizzy
  module Repositories
    class QuizRepository < Koine::Repository::Repository
      include Koine::Repository::Repository::IdAwareEntity

      def all
        find_all_by({})
      end
    end
  end
end
