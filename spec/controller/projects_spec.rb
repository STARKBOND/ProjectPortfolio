# Could be required to authenticate after `user = create(:user)`
  # allow(controller).to receive(:authenticate_user!).and_return(true)
  # allow(controller).to receive(:current_user).and_return(@user)

require "rails_helper"
require 'database_cleaner/active_record'

RSpec.describe ProjectsController, type: :controller do
  before(:context) do
    RSpec::Mocks.with_temporary_scope do
      @user = create(:user)
      @project = Project.create(title: "Test title", description: "Test description")
    end
  end

  before(:each) { sign_in @user }

  context "GET #index" do
    it "returns a success response (any user is able to see projects homepage)" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context "GET #show" do
    it "returns a success response (any user is able to show a project)" do
      get :show, params: { :id => @project.id }
      expect(response).to have_http_status(:success)
    end
  end

  context "GET projects#new" do
    it "returns a success response (user is signed in)" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context "POST projects#create" do
    it "redirects user to projects page after successful creation" do
      project_attributes = { :title => @project.title, :description => @project.description }
      post :create, params: { :project => project_attributes }
      expect(response).to have_http_status(:redirect)
    end
    it "returns error after unsuccessful creation with invalid project" do
      project_attributes = { :title => "", :description => "" }
      post :create, params: { :project => project_attributes }
      expect(response).to have_http_status(422) # unprocessable entity error
    end
  end

  context "PATCH projects#update" do
    it "redirects user to projects page after successful update" do
      project_attributes = { :title => @project.title, :description => @project.description }
      patch :update, params: { :id => @project.id, :project => project_attributes }
      expect(response).to have_http_status(:redirect)
    end
    it "returns error after unsuccessful creation with invalid project" do
      project_attributes = { :title => "", :description => "" }
      patch :update, params: { :id => @project.id, :project => project_attributes }
      expect(response).to have_http_status(422) # unprocessable entity error
    end
  end

  context "GET projects#edit" do
    it "redirects user to edit project page" do
      get :edit, params: { :id => @project.id }
      expect(response).to have_http_status(:success)
    end
  end

  context "DELETE projects#destroy" do
  it "redirects user to projects page after successful deletion" do
    delete :destroy, params: { :id => @project.id }
    expect(response).to have_http_status(:redirect)
    end
  end
end