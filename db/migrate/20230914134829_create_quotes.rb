class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :philosopher, null: false, foreign_key: { on_delete: :cascade }
      t.text :text, null: false
      t.integer :publication_year
      t.text :comment
      t.boolean :is_public, default: false 

      t.timestamps
    end
  end
end
