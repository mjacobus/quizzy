require 'spec_helper'
require_relative '../../../../apps/admin/views/quizzes/show'

describe Admin::Views::Quizzes::Show do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/quizzes/show.html.erb') }
  let(:view)      { Admin::Views::Quizzes::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
