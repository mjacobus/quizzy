class SessionsController < ApplicationController
  def create
    oauth = Quizzy::Infrastructure::Oauth.new(request.env)
    user = user_service.find_or_create_by_oauth(oauth)
    auth_service.login(user)

    url = oauth.origin || root_url
    redirect_to url, notice: "Welcome #{user.name}!"
  end

  def destroy
    auth_service.logout
    redirect_to root_url
  end

  def failure
    redirect_to root_url
  end
end
