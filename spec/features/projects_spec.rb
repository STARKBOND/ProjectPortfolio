require 'rails_helper'
require 'database_cleaner/active_record'

RSpec.feature "Projects", type: :feature do
  context "User / Project stub" do
    before(:each) do
      @user = User.create(:id => 1, :email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
      @email = "user@example.com"
      @password = "password"
      visit new_user_session_path
      within("form") do
        fill_in "inputEmail", with: @email
        fill_in "inputPassword", with: @password
      end
      click_on "logIn"
      visit new_project_path
      within("form") do
        fill_in "title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "description", with: "Test description"
      click_button "createProject"
      expect(page).to have_content("Project was successfully created")
      Project.destroy_all
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end

    context "Update project" do
      # let(:project) { @user.projects.create(title: "Test title", description: "Test content") }
      #project = @user.projects.create(title: "Test title", description: "Test content")
      before(:each) do
        @user = FactoryBot.create(:user)
        @mock = FactoryBot.build(:project)
        @project = @user.projects.create(title: @mock.title, description: @mock.description)
        visit edit_project_path(@project)
      end

      scenario "should be successful" do
        within("form") do
          fill_in "description", with: "New description content"
        end
        click_button "editProject"
        expect(page).to have_content("Project was successfully updated")
      end

      scenario "should fail" do
        within("form") do
          fill_in "description", with: ""
        end
        click_button "editProject"
        expect(page).to have_content("Description can't be blank")
      end
    end
  end

  context "Remove existing project" do
    setup do
      visit new_user_session_path
      within("form") do
        fill_in "inputEmail", with: "user@example.com"
        fill_in "inputPassword", with: "password"
      end
      click_on "logIn"
    end
    
    scenario "remove project" do
      Project.destroy_all
      @user = FactoryBot.create(:user)
      @project = @user.projects.create(id: 1, title: "Test title", description: "Test content")
      visit project_path(Project.find(1))
      click_on "destroyProject"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end

    scenario "Log out" do
      click_on "logOut"
      expect(page).to have_content("Logged out successfully.")
    end
  end
end