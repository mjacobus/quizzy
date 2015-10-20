module Application
  module Concerns
    module ApplicationDependenciesAware

      def login_service
        @login_service ||= create_auth_service
      end

      def user_service
        @user_service ||= dependencies.fetch("Quizzy::User::UserService")
      end

      def dependencies
        @dependencies ||= Application::Dependencies.instance
      end

      private

      def create_auth_service
        dependencies.define(:http_session) do
          session
        end

        dependencies.fetch("Application::Auth::SessionLoginService")
      end
    end
  end
end
