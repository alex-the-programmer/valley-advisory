class AddContentTypeAndFileNameToResumes < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :file_name, :string
    add_column :resumes, :content_type, :string
  end
end
