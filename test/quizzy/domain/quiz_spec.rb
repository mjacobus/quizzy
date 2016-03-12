require "test_helper"

describe Quizzy::Domain::Quiz do
  subject { Quizzy::Domain::Quiz.new }

  properties = [
    :id,
    :title,
    :description,
    :private,
    :created_at,
    :updated_at,
  ]

  properties.each do |property|
    it "has accessor for #{property}" do
      subject.must_respond_to property.to_sym
      subject.must_respond_to "#{property}=".to_sym
    end
  end
end
