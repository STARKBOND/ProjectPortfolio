class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  # Update method was meant to be overridden. Spent hours on this test.
  # Code From: bit.ly/3VBRveD (I modified it to make it work)
  def update_with_password(params, *options)
  current_password = params.delete(:current_password)

  if params[:password].blank?
    params.delete(:password)
    params.delete(:password_confirmation) if params[:password_confirmation].blank?
  end

  result = if params[:password].blank? || valid_password?(current_password)
    update(:password=> params[:password])
  else
    self.assign_attributes(params, *options)
    self.valid?
    self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
    false
  end

  clean_up_passwords
  result

  end
end