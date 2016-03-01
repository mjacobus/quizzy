module Application
  module Auth
    class SessionLoginService
      UserNotLoggedInError = Class.new(RuntimeError)
      UserHasNoIdError = Class.new(RuntimeError)

      def initialize(session, user_repository)
        @session = session
        @user_repository = user_repository
        @current_user
      end

      def login(user)
        raise UserHasNoIdError unless user.id
        session[:user_id] = user.id
        @current_user = user
      end

      def logout
        session.delete(:user_id)
      end

      def user_logged?
        user_id != nil
      end

      def current_user
        raise UserNotLoggedInError unless user_logged?
        @current_user ||= user_repository.find(user_id)
      end

      private

      def user_id
        session[:user_id]
      end

      attr_reader :session, :user_repository
    end
  end
end

