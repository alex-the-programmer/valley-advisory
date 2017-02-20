class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_address1
      t.string :street_address2
      t.string :city
      t.string :county
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps
    end

    add_foreign_key :companies, :addresses
  end
end
