class SessionsController < ApplicationController
  def create
    oauth = Quizzy::Auth::Oauth.new(request.env)
    user = user_service.find_or_create_by_oauth(oauth)
    auth_service.login(user)

    url = oauth.origin || root_url
    redirect_to url, notice: "Welcome #{user.name}!"
  end

  def destroy
  end

  def failure
  end
end
