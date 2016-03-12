require "test_helper"

module Quizzy::Infrastructure
  describe Oauth do
    let(:env) do
      {
        "omniauth.auth" => auth_params,
        "omniauth.origin" => origin,
      }
    end

    let(:origin) { "some url" }
    let(:auth_params) do
      {
        uid: "uid",
        provider: "google",
        info: {
          name: "some name",
          email: "email@email",
        }
      }
    end

    let(:oauth) { Oauth.new(env) }

    it "returns #provider" do
      oauth.provider.must_equal "google"
    end

    it "returns #uid" do
      oauth.uid.must_equal "uid"
    end

    it "returns #name" do
      oauth.name.must_equal "some name"
    end

    it "returns #email" do
      oauth.email.must_equal "email@email"
    end

    it "returns #provider_data" do
      oauth.provider_data.must_equal auth_params.to_json
    end

    it "returns #origin" do
      oauth.origin.must_equal origin
    end

  end
end
