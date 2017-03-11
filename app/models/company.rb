class Company < ApplicationRecord
  belongs_to :address
  has_many :hiring_managers, dependent: :destroy
  has_many :roles, dependent: :destroy

  accepts_nested_attributes_for :address

  validates_presence_of :name
end
