require "test_helper"

describe Quizzy::Infrastructure::QuizRepository do
  let(:repository) { Quizzy::Infrastructure::QuizRepository.new(stub) }

  it "extends Koine::Repository::Repository" do
    repository.is_a?(Koine::Repository::Repository).must_equal true
  end

  it "includes Koine::Repository::Repository::IdAwareEntity" do
    repository.class.ancestors.include?(Koine::Repository::Repository::IdAwareEntity).
      must_equal true
  end
end
