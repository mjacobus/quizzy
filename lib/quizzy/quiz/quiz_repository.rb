module Quizzy
  module Quiz
    class QuizRepository < Koine::Repository::Repository
      include Koine::Repository::Repository::IdAwareEntity
    end
  end
end
