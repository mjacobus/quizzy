require "spec_helper"

describe Web::Controllers::Admin::Quizzes::Index do
  let(:action) { Web::Controllers::Admin::Quizzes::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end