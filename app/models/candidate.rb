class Candidate < ApplicationRecord
  belongs_to :user
  has_one :resume, foreign_key: :user_id

  accepts_nested_attributes_for :resume


  validates_presence_of :first_name, :last_name, :email, :phone, :desired_position
end
