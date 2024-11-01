class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :is_admin, default: false 
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

