require "spec_helper"
require_relative "../../../../apps/web/views/quizzes/show"

describe Web::Views::Quizzes::Show do
  let(:exposures) { Hash[foo: "bar"] }
  let(:template)  { Lotus::View::Template.new("apps/web/templates/quizzes/show.html.erb") }
  let(:view)      { Web::Views::Quizzes::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
