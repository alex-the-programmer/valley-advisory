class CreateHiringManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :hiring_managers do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :position

      t.timestamps
    end

    add_foreign_key :hiring_managers, :users
    add_foreign_key :hiring_managers, :companies
  end
end
