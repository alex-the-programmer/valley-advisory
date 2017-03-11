class Role < ApplicationRecord
  belongs_to :company

  validates_presence_of :company_id, :name
end
