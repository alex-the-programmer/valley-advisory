json.extract! resume, :id, :user_id, :resume_data, :created_at, :updated_at
json.url resume_url(resume, format: :json)