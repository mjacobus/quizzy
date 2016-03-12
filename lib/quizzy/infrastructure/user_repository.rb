module Quizzy::Infrastructure
  class UserRepository  < Koine::Repository::Repository
    include Koine::Repository::Repository::IdAwareEntity
  end
end
