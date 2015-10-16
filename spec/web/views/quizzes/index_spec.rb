require "spec_helper"
require_relative "../../../../apps/web/views/quizzes/index"

describe Web::Views::Quizzes::Index do
  let(:exposures) { Hash[foo: "bar"] }
  let(:template)  { Lotus::View::Template.new("apps/web/templates/quizzes/index.html.erb") }
  let(:view)      { Web::Views::Quizzes::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
