class Address < ApplicationRecord
  validates_presence_of :street_address1, :city, :state, :zip
end
