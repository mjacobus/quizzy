require "spec_helper"

describe Web::Views::Admin::Quizzes::Index do
  let(:exposures) { Hash[foo: "bar"] }
  let(:template)  { Lotus::View::Template.new("apps/web/templates/admin/quizzes/index.html.erb") }
  let(:view)      { Web::Views::Admin::Quizzes::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end