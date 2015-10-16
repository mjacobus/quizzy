module Quizzy::User
  class UserRepository  < Koine::Repository::Repository
    include Koine::Repository::Repository::IdAwareEntity
  end
end
