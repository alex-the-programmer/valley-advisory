class Resume < ApplicationRecord
  belongs_to :candidate

  validates_presence_of :resume_data
end
