class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :desired_position
      t.string :current_company
      t.string :linked_in_url
      t.string :twitter_url
      t.string :git_hub_url
      t.string :portfolio_url
      t.string :website_url

      t.timestamps
    end

    add_foreign_key :candidates, :users
  end
end
