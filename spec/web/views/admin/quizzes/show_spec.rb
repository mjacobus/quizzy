require "spec_helper"

describe Web::Views::Admin::Quizzes::Show do
  let(:exposures) { Hash[foo: "bar"] }
  let(:template)  { Hanami::View::Template.new("apps/web/templates/admin/quizzes/show.html.erb") }
  let(:view)      { Web::Views::Admin::Quizzes::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
