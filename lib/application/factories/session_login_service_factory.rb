require "application/auth/session_login_service"

module Application
  module Factories
    class SessionLoginServiceFactory
      def create_service(dependencies)
        repository = dependencies.get(Quizzy::User::UserRepository)
        session = dependencies.fetch(:http_session)
        Application::Auth::SessionLoginService.new(session, repository)
      end
    end
  end
end
