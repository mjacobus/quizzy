require "nurse"

module Application
  class Dependencies < ::Nurse::DependencyContainer
    def self.instance
      @@instance ||= new
    end

    def initialize
      define(:db_connection) do
        Sequel.connect ENV["QUIZZY_DATABASE_URL"]
      end

      define("Quizzy::Repositories::QuizRepository") do |di|
        # testable factory
        require "application/factories/quiz_repository_factory"
        Application::Factories::QuizRepositoryFactory.new.create_service(di)
      end

      define("Quizzy::Services::QuizService") do |di|
        require "application/factories/quiz_service_factory"
        Application::Factories::QuizServiceFactory.new.create_service(di)
      end

      define("Quizzy::User::UserRepository") do |di|
        require "application/factories/user_repository_factory"
        Application::Factories::UserRepositoryFactory.new.create_service(di)
      end

      define("Quizzy::User::UserService") do |di|
        require "application/factories/user_service_factory"
        Application::Factories::UserServiceFactory.new.create_service(di)
      end

      define("Application::Auth::SessionLoginService") do |di|
        require "application/factories/session_login_service_factory"
        Application::Factories::SessionLoginServiceFactory.new.create_service(di)
      end
    end
  end
end
