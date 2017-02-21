class Company < ApplicationRecord
  belongs_to :address
  has_many :hiring_managers

  accepts_nested_attributes_for :address

  validates_presence_of :name
end
