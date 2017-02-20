class Candidate < ApplicationRecord
  belongs_to :user
  has_one :resume, foreign_key: :user_id

  validates_presence_of :first_name, :last_name, :email, :phone, :desired_position
end
