# Could be required to authenticate after `user = create(:user)`
  # allow(controller).to receive(:authenticate_user!).and_return(true)
  # allow(controller).to receive(:current_user).and_return(@user)

require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  context "stub" do
    before(:all) do
      RSpec::Mocks.with_temporary_scope do
        user = create(:user)
        # authenticate?
        project = Project.create(title: "Test title", description: "Test description")
      end

      context "GET #index" do
        it "returns a success response (any user is able to see projects homepage)" do
          get :index
          expect(response).to have_http_status(:success)
        end
      end

      context "GET #show" do
        it "returns a success response (any user is able to show a project)" do
          get :show, params: { id: project }
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
        it "returns a success response (user is signed in)" do
          post :create, params: { id: project }
          expect(response).to have_http_status(:success)
        end
      end

      context "GET projects#edit" do
        it "returns a success response (user is signed in)" do
          get :edit, params: { id: project }
          expect(response).to have_http_status(:success)
        end
      end

      context "GET projects#edit" do
        it "returns a success response (user is signed in)" do
          delete :destroy, params: { id: project }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end