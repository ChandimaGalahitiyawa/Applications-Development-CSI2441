class CreatePhilosophers < ActiveRecord::Migration[7.0]
  def change
    create_table :philosophers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :birth_year
      t.integer :death_year
      t.text :biography

      t.timestamps
    end
  end
end

