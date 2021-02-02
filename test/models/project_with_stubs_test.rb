require "test_helper"

class ProjectWithStubsTest < ActiveSupport::TestCase
    test "let's stub an object" do
        project = Project.new(name: "Project Greenlight")
        project.stubs(:name)
        assert_nil(project.name)
    end
end