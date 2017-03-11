class Role < ApplicationRecord
  belongs_to :company
  belongs_to :hiring_manager

  validates_presence_of :company_id, :name
end
