require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test "is dependency aware" do
    assert @controller.is_a?(Application::Concerns::ApplicationDependenciesAware)
  end
end
