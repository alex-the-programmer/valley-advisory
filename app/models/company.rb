class Company < ApplicationRecord
  has_one :address

  accepts_nested_attributes_for :address

  validates_presence_of :name
end
