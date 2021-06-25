#START:P1
require "rails_helper"

RSpec.describe "adding a new task" do

  let(:project) { create(:project, name: "Project Bluebook") }
  let!(:task_1) { create(
  :task, project: project, title: "Search Sky", size: 1, project_order: 1) }
  let!(:task_2) { create(
  :task, project: project, title: "Use Telescope", size: 1,
  project_order: 2) }
  let!(:task_3) { create(
  :task, project: project, title: "Take Notes", size: 1, project_order: 3) }
  let(:user) { create(:user) }

  before(:example) do
      Role.create(user: user, project: project)
      sign_in(user)
  end

  let!(:project) { create(:project, name: "Project Bluebook") }
  let!(:task_1) { create(
    :task, project: project, title: "Search Sky", size: 1, project_order: 1) }
  let!(:task_2) { create(
    :task, project: project, title: "Use Telescope", size: 1,
           project_order: 2) }
  let!(:task_3) { create(
    :task, project: project, title: "Take Notes", size: 1,
           project_order: 3) }

  it "can re-order a task" do
    visit(project_path(project))
    find("#task_3")
    within("#task_3") do
      click_on("Up")
    end
    expect(page).to have_selector(
      "tbody:nth-child(2) .name", text: "Take Notes")

    visit(project_path(project))
    find("#task_2")
    within("#task_2") do
      expect(page).to have_selector(".name", text: "Use Telescope")
    end
  end

end
