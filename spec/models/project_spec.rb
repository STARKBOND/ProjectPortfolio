require "rails_helper"
require 'database_cleaner/active_record'

RSpec.describe Project, type: :model do
  context "stub" do
    before(:all) do
      @user = create(:user)
    end
    context "validations tests" do
      it "ensures the title is present" do
        @project = Project.new(description: "Content of the description")
        expect(@project.valid?).to eq(false)
      end

      it "ensures the description is present" do
        @project = Project.new(title: "Title")
        expect(@project.valid?).to eq(false)
      end
      
      it "should be able to save project" do
        @project = @user.projects.create(title: "Test title", description: "Test content")
        expect(@project.save).to eq(true)
      end
    end

    context "scopes tests" do
      let(:params) { { title: "Title", description: "some description" } }
      before(:each) do
        DatabaseCleaner.clean
        @user.projects.create(params)
        @user.projects.create(params)
        @user.projects.create(params)
      end
      it "should return all projects" do
        expect(Project.count).to eq(3)
      end
    end
  end
end