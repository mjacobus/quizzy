require "nurse"
require "sequel"

module Application
  class Dependencies < ::Nurse::DependencyContainer
    def self.instance
      @@instance ||= new
    end

    def initialize
      define(:db_connection) do
        Sequel.connect Rails.application.secrets.fetch(:db_string)
        # ActiveRecord::Base.connection
      end

      initialize_app_auth_module
      initialize_quiz_module
      initialize_user_module
    end

    private

    #
    # Application::Auth module
    #
    def initialize_app_auth_module
      define("Application::Auth::SessionLoginService") do |di|
        require "application/factories/session_login_service_factory"
        Application::Factories::SessionLoginServiceFactory.new.create_service(di)
      end
    end

    #
    # Quizzy::Quiz module
    #
    def initialize_quiz_module
      define("Quizzy::Infrastructure::QuizRepository") do |di|
        # testable factory
        require "application/factories/quiz_repository_factory"
        Application::Factories::QuizRepositoryFactory.new.create_service(di)
      end

      define("Quizzy::Quiz::QuizService") do |di|
        require "application/factories/quiz_service_factory"
        Application::Factories::QuizServiceFactory.new.create_service(di)
      end
    end

    #
    # Quizzy::User module
    #
    def initialize_user_module
      define("Quizzy::Infrastructure::UserRepository") do |di|
        require "application/factories/user_repository_factory"
        Application::Factories::UserRepositoryFactory.new.create_service(di)
      end

      define("Quizzy::User::UserService") do |di|
        require "application/factories/user_service_factory"
        Application::Factories::UserServiceFactory.new.create_service(di)
      end
    end
  end
end
