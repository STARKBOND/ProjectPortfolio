class Project < ApplicationRecord
    # Presence validators of required fields in Project
    validates_presence_of :title, :description

    belongs_to :user
end
