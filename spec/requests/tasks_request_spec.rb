require "rails_helper"

RSpec.describe "task requests" do

    before(:example) do
        ActionMailer::Base.deliveries.clear
    end

    let(:project) { create(:project, name: "Project Bluebook") }
    let(:task) {  create(:task, project: project, title: "Learn how to test mailers", size: 3) }


    it "does not send an email if a task is not completed" do
        patch(task_path(id: task.id), params: {task: {completed: false}})
        expect(ActionMailer::Base.deliveries.size).to eq(0)
    end

end
