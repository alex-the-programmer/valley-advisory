class Resume < ApplicationRecord
  belongs_to :candidate, primary_key: :user_id

  validates_presence_of :resume_data
end
