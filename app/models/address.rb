class Address < ApplicationRecord
  has_one :company
  validates_presence_of :street_address1, :city, :state, :zip
end
