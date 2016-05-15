class CreateAddPrefidToUsers < ActiveRecord::Migration
  def change
    create_table :add_prefid_to_users do |t|
      t.integer :pref_id

      t.timestamps null: false
    end
  end
end
