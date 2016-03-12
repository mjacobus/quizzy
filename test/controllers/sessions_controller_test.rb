require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "creates or logins user and root url" do
    make_request

    assert_redirected_to root_url
  end

  test "creates or logins user and redirects to origin" do
    url = "/urlfoo"
    stub_env(url)
    make_request

    assert_redirected_to url
  end

  test "can logout" do
    auth_service = stub
    auth_service.expects(:logout)

    @controller.stubs(:auth_service).returns(auth_service)

    get :destroy
    assert_redirected_to root_url
  end

  private

  def make_request
    user = stub(name: 'John Doe')
    auth_service = stub
    user_service = stub

    oauth = Quizzy::Auth::Oauth.new(request.env)

    user_service.expects(:find_or_create_by_oauth).with do |param|
      param.origin == oauth.origin
    end.returns(user)

    auth_service.expects(:login).with(user)

    @controller.stubs(:user_service).returns(user_service)
    @controller.stubs(:auth_service).returns(auth_service)

    get :create, provider: :google_oauth2
  end

  def stub_env(url)
    request.env['omniauth.origin'] = url
  end
end
