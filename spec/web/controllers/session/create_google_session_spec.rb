require "spec_helper"
require_relative "../../../../apps/web/controllers/session/create_google_session"

describe Web::Controllers::Session::CreateGoogleSession do
  let(:action) { Web::Controllers::Session::CreateGoogleSession.new }
  let(:params) { Hash[] }

  it "is successful" do
    skip
    response = action.call(params)
    response[0].must_equal 200
  end
end
