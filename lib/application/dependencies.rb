require "nurse"
require "sequel"
require "singleton"

module Application
  class Dependencies < ::Nurse::DependencyContainer
    include Singleton

    def initialize
      define(:db_connection) do
        Sequel.connect Rails.application.secrets.fetch(:db_string)
        # ActiveRecord::Base.connection
      end

      initialize_infrastructure
      initialize_services
    end

    private

    def initialize_services
      define("Application::Auth::SessionLoginService") do |di|
        require "application/factories/session_login_service_factory"
        Application::Factories::SessionLoginServiceFactory.new.create_service(di)
      end

      define("Quizzy::Service::QuizService") do |di|
        require "application/factories/quiz_service_factory"
        Application::Factories::QuizServiceFactory.new.create_service(di)
      end

      define("Quizzy::Service::UserService") do |di|
        require "application/factories/user_service_factory"
        Application::Factories::UserServiceFactory.new.create_service(di)
      end
    end

    def initialize_infrastructure
      define("Quizzy::Infrastructure::QuizRepository") do |di|
        require "application/factories/quiz_repository_factory"
        Application::Factories::QuizRepositoryFactory.new.create_service(di)
      end

      define("Quizzy::Infrastructure::UserRepository") do |di|
        require "application/factories/user_repository_factory"
        Application::Factories::UserRepositoryFactory.new.create_service(di)
      end
    end
  end
end
