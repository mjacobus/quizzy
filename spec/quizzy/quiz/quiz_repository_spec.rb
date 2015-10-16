require "spec_helper"

describe Quizzy::Quiz::QuizRepository do
  let(:repository) { Quizzy::Quiz::QuizRepository.new(stub) }

  it "extends Koine::Repository::Repository" do
    repository.is_a?(Koine::Repository::Repository).must_equal true
  end

  it "includes Koine::Repository::Repository::IdAwareEntity" do
    repository.class.ancestors.include?(Koine::Repository::Repository::IdAwareEntity).
      must_equal true
  end

end
