module Quizzy
  module Infrastructure
    class QuizRepository < Koine::Repository::Repository
      include Koine::Repository::Repository::IdAwareEntity
    end
  end
end
