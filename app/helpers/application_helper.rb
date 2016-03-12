module ApplicationHelper
  include Application::Concerns::ApplicationDependenciesAware

  def current_user
    auth_service.current_user if auth_service.user_logged?
  end
end
