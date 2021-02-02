require "test_helper"

class ProjectWithStubsTest < ActiveSupport::TestCase
    #START: first_stub
    test "let's stub an object" do
        project = Project.new(name: "Project Greenlight")
        project.stubs(:name)
        assert_nil(project.name)
    end
    #END: first_stub

    #START: second_stub
    test "let's stub an object again" do
        project = Project.new(name: "Project Greenlight")
        project.stubs(:name).returns("Fred")
        assert_equal("Fred", project.name)
    end
    #END: second_stub

    #START: third_stub
    test "let's stub a class" do
        Project.stubs(:find).returns(Project.new(name: "Project Greenlight"))
        project = Project.find(1)
        assert_equal("Project Greenlight", project.name)
    end
    #END: third_stub
end