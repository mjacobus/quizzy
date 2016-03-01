require "test_helper"

require "quizzy/user/user"

describe Quizzy::User::User do
  subject { Quizzy::User::User.new }

  properties = [
    :id,
    :name,
    :email,
    :provider,
    :uid,
    :created_at,
    :updated_at,
    :provider_data,
  ]

  properties.each do |property|
    it "has accessor for #{property}" do
      subject.must_respond_to property.to_sym
      subject.must_respond_to "#{property}=".to_sym
    end
  end
end
