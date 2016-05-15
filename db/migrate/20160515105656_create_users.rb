class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :company
      t.string :sei
      t.string :mei
      t.integer :postal_code, limit: 7
      t.string :adress
      t.string :mail
      t.integer :tel

      t.timestamps null: false
    end
  end
end
