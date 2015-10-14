require 'spec_helper'
require_relative '../../../../apps/admin/views/quizzes/index'

describe Admin::Views::Quizzes::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/quizzes/index.html.erb') }
  let(:view)      { Admin::Views::Quizzes::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
