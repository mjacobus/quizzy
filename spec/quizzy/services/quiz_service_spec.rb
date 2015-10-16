require "spec_helper"
require "quizzy/services/quiz_service"

describe Quizzy::Services::QuizService do
  let(:repository) { Minitest::Mock.new }
  let(:service) { Quizzy::Services::QuizService.new(repository) }

  describe "#all" do
    it "returns all records" do
      records = []
      repository.expect(:find_all_by, records, [{}])

      returned = service.all
      returned.must_be_same_as(records)

      repository.verify
    end
  end

  describe "#create" do
    describe "with valid data" do
      it "create a record" do
        record = Minitest::Mock.new
        repository.expect(:create, nil, [record])

        service.create(record)

        repository.verify
      end
    end
  end
end
