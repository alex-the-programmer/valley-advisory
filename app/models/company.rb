class Company < ApplicationRecord
  belongs_to :address

  accepts_nested_attributes_for :address

  validates_presence_of :name
end
