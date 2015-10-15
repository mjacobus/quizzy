require "spec_helper"
require "application/auth/session_login_service"

describe Application::Auth::SessionLoginService do
  let(:session) { {} }
  let(:user) { stub(id: :user_id) }
  let(:user_repository) { stub }
  let(:service) { Application::Auth::SessionLoginService.new(session, user_repository) }

  describe "#login" do

    it "logs user in" do
      service.login(user)
      session[:user_id].must_equal :user_id
    end

    it "sets current user" do
      service.login(user)
      service.current_user.must_be_same_as(user)
    end

    it "raises error if user has no id" do
      proc do
        service.login(stub(id: nil))
      end.must_raise Application::Auth::SessionLoginService::UserHasNoIdError
    end
  end

  describe "#logout" do

    it "logs user out" do
      session[:user_id] = :user_id
      service.logout
      session[:user_id].must_equal nil
    end
  end

  describe "#user_logged?" do

    it "returns true when user is logged in" do
      session[:user_id] = :user_id
      service.user_logged?.must_equal true
    end

    it "returns false when user is not logged in" do
      session[:user_id] = nil
      service.user_logged?.must_equal false

      session.delete(:user_id)
      service.user_logged?.must_equal false
    end

  end

  describe "#current_user" do

    it "returns the session user and caches it" do
      session[:user_id] = :user_id
      user_repository.expects(:find).with(:user_id).returns(user)

      current_user = service.current_user
      current_user.must_be_same_as(user)
      service.current_user.must_be_same_as(current_user)
    end

    it "raises an exception when user is not logged in" do
      proc do
        service.current_user
      end.must_raise Application::Auth::SessionLoginService::UserNotLoggedInError
    end
  end
end
