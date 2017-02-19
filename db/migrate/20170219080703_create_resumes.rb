class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.bytea :resume_data

      t.timestamps
    end
  end

  add_foreign_key :resumes, :users
end
