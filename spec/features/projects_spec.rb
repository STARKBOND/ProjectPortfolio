require 'rails_helper'
require 'database_cleaner/active_record'

RSpec.feature "Projects", type: :feature do
  context "User / Project stub" do
    before(:each) do
      user = User.create(:id => 1, :email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
      visit new_user_session_path
      within("form") do
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "password"
      end
      click_on "Log in"
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
      Project.destroy_all
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  

    context "Update project" do
      let(:project) { Project.create(title: "Test title", description: "Test content") }
      before(:each) do
        visit edit_project_path(project)
      end

      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Project"
        expect(page).to have_content("Project was successfully updated")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("Description can't be blank")
      end
    end
  end

  context "Remove existing project" do
    setup do
      visit new_user_session_path
      within("form") do
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "password"
      end
      click_on "Log in"
    end
    
    scenario "remove project" do
      Project.destroy_all
      Project.create(id: 1, title: "Test title", description: "Test content")
      visit project_path(Project.find(1))
      click_on "Destroy this project"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end

    scenario "Log out" do
      click_on "Log Out"
      expect(page).to have_content("Logged out successfully.")
    end
  end
end