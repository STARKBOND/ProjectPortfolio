# Could be required to authenticate after `user = create(:user)`
  # allow(controller).to receive(:authenticate_user!).and_return(true)
  # allow(controller).to receive(:current_user).and_return(@user)

require "rails_helper"

# RSpec.describe ProjectsController, type: :controller do
#   before(:context) do
#     RSpec::Mocks.with_temporary_scope do
#       @user = create(:user)
#     end
#   end
#   it "should print user" do
#     puts @user.inspect 
#   end
# end

RSpec.describe ProjectsController, type: :controller do
  before(:context) do
    RSpec::Mocks.with_temporary_scope do
      @user = create(:user)
      @project = Project.create(title: "Test title", description: "Test description")
    end
  end
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
      expect(response).to have_http_status('302')
    end
  end

  context "GET projects#edit" do
    it "redirects user to edit project page" do
      get :edit, params: { :id => @project.id }
      expect(response).to have_http_status(:success)
    end
  end
end