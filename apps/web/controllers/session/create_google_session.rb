require "application/concerns/application_dependencies_aware"

module Web::Controllers::Session
  class CreateGoogleSession
    include Web::Action
    include Application::Concerns::ApplicationDependenciesAware

    def call(params)
      oauth = Quizzy::Auth::Oauth.new(request.env)
      user = user_service.find_or_create_by_oauth(oauth)
      login_service.login(user)

      url = oauth.origin || routes.admin_quizzes_url
      flash[:notice] = "Welcome #{user.name}!"
      redirect_to url
    end
  end
end
