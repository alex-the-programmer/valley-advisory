class Resume < ApplicationRecord
  #belongs_to :candidate, foreign_key: :user_id

  validates_presence_of :resume_data
end
