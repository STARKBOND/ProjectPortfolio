require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do
    before(:each) {
        @request.env["devise.mapping"] = Devise.mappings[:user]
    }
    context "GET index" do
        it "returns a success response" do
            get :new
            expect(response).to have_http_status(:success)
        end
    end
    context "POST registrations#create" do
        render_views
        it "redirects user to root projects page after successful creation" do
            post :create, params: { user: { :email => "user@example.com", :password => "password", :password_confirmation => "password" } }
            expect(response).to redirect_to(:root)
        end
        it "returns error on the page after blank password creation attempt" do
            post :create, params: { user: { :email => "user@example.com", :password => "", :password_confirmation => "" } }
            expect(response.body).to have_text("Password can't be blank")
        end
    end
    context "PUT registrations#update" do
        render_views
        let(:user) { create(:user, :email => "joe@examplecom", :password => "password", :password_confirmation => "password") }
        it "should edit password successfully" do
            sign_in user
            put :update, params: { :password => "newpassword",  :password_confirmation => "newpassword", :current_password => "password" }
            subject.current_user.reload
            expect(flash[:notice]).to match("Your account has been updated successfully.")
        end
    end
end