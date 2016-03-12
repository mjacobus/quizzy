module Application
  module Concerns
    module ApplicationDependenciesAware

      def auth_service
        @auth_service ||= create_auth_service
      end

      def user_service
        @user_service ||= dependencies.fetch("Quizzy::Service::UserService")
      end

      def dependencies
        @dependencies ||= Application::Dependencies.instance
      end

      private

      def create_auth_service
        unless dependencies.defined?(:http_session)
          dependencies.define(:http_session) do
            session
          end
        end

        dependencies.fetch("Application::Auth::SessionLoginService")
      end
    end
  end
end
