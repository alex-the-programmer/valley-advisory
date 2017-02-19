class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.integer :user_id

      t.timestamps
    end

    add_column :resumes, :resume_data, :bytea
    add_foreign_key :resumes, :candidates, column: :user_id
  end
end
