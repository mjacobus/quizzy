require 'spec_helper'
require_relative '../../../../apps/admin/controllers/quizzes/index'

describe Admin::Controllers::Quizzes::Index do
  let(:action) { Admin::Controllers::Quizzes::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
