require 'rails_helper'

RSpec.describe User, type: :model do
  context "stub" do
    before(:all) do
      user = create(:user)
    end

  # :registerable
  # it 'required_fields should contain the fields that Devise uses' do
  #   assert_equal [], Devise::Models::Registerable.required_fields(User)
  # end

  # :validatable
  # it 'required_fields should be an empty array' do
  #   assert_equal [], Devise::Models::Validatable.required_fields(User)
  # end

  # :database_authenticatable
  # it 'required_fields should be encryptable_password and the email field by default' do
  #   assert_equal [
  #     :encrypted_password,
  #     :email
  #   ], Devise::Models::DatabaseAuthenticatable.required_fields(User)
  # end

  # :recoverable
  # it 'required_fields should contain the fields that Devise uses' do
  #   assert_equal [
  #     :reset_password_sent_at,
  #     :reset_password_token
  #   ], Devise::Models::Recoverable.required_fields(User)
  # end

  # :rememberable
  # it 'should have the required_fields array' do
  #   assert_equal [
  #     :remember_created_at
  #   ], Devise::Models::Rememberable.required_fields(User)
  # end
  end
end
