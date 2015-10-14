require "nurse"

class ApplicationDependencies < ::Nurse::DependencyContainer
  def self.instance
    @@instance ||= new
  end

  def initialize
    define(:db_connection) do
      Sequel.connect ENV["QUIZZY_DATABASE_URL"]
    end

    define("Quizzy::Repositories::QuizRepository") do |di|
      adapter = Koine::Repository::Persistence::Adapter::Sql.new(
        di.get(:db_connection),
        :quizzes
      )
      repository = Quizzy::Repositories::QuizRepository.new(adapter)
      repository.hydrator         = Koine::Hydrator::Hydrator.new
      repository.entity_prototype = Quizzy::Entities::Quiz.new
      repository
    end
  end
end
