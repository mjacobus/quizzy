require "spec_helper"
require "support/oauth"
require "apps/web/controllers/session/create_google_session"
require "support/test_db"

describe Web::Controllers::Session::CreateGoogleSession do
  include OauthSpecHelper
  include DbSpecHelper

  let(:action) { Web::Controllers::Session::CreateGoogleSession.new }
  let(:params) { Hash[] }

  it "redirects to origin" do
    inside_transaction do
      stub_action_with_oauth(action, :google_oauth2, "/origin")
      response = action.call(params)
      response[0].must_equal 302
      response[1]["Location"].must_equal "/origin"
    end
  end
end
