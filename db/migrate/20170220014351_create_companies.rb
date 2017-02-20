class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :address_id
      t.string :cloudbase_url
      t.string :linkedin_url
      t.string :glassdoors_url

      t.timestamps
    end
  end
end
