class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.belongs_to :company
      t.belongs_to :hiring_manager
      t.string :name
      t.text :description
      t.integer :min_rate
      t.integer :max_rate
      t.string :employment_time
      t.string :employment_type
      t.integer :contract_duration_in_months
      t.string :travel_type
      t.boolean :sponsors_visa
      t.string :city
      t.string :state

      t.timestamps
    end

    add_foreign_key :roles, :companies
    add_foreign_key :roles, :hiring_managers
  end
end
