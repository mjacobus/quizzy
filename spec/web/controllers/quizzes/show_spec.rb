require "spec_helper"
require_relative "../../../../apps/web/controllers/quizzes/show"

describe Web::Controllers::Quizzes::Show do
  let(:action) { Web::Controllers::Quizzes::Show.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
