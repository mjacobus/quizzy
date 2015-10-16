require 'spec_helper'
require_relative '../../../../apps/admin/controllers/quizzes/show'

describe Admin::Controllers::Quizzes::Show do
  let(:action) { Admin::Controllers::Quizzes::Show.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
