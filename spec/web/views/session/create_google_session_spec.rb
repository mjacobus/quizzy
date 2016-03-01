require "spec_helper"
require_relative "../../../../apps/web/views/session/create_google_session"

describe Web::Views::Session::CreateGoogleSession do
  let(:exposures) { Hash[foo: "bar"] }
  let(:template)  { Hanami::View::Template.new("apps/web/templates/session/create_google_session.html.erb") }
  let(:view)      { Web::Views::Session::CreateGoogleSession.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
