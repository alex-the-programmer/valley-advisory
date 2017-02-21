class HiringManager < ApplicationRecord
  belongs_to :company
  belongs_to :user

  accepts_nested_attributes_for :user

  validates_presence_of  :position
end
