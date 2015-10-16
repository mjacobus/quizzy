module Web::Controllers::Session
  class CreateGoogleSession
    include Web::Action

    def call(params)
      oauth = Quizzy::Auth::Oauth.new(request.env)
      user = user_service.find_or_create_by_oauth(oauth)

      login_service.login(user)

      url = oauth.origin
      # TODO: Use routes to build url
      url ||= '/admin/quizzes'

      redirect_to url
    end

    def user_service
      dependencies.fetch("Quizzy::User::UserService")
    end

    def login_service
      @login_service ||= create_auth_service
    end

    def create_auth_service
      dependencies.define(:http_session) do
        session
      end

      dependencies.fetch("Application::Auth::SessionLoginService")
    end

    def dependencies
      Application::Dependencies.instance
    end
  end
end
