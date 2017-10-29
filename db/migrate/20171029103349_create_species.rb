class CreateSpecies < ActiveRecord::Migration[5.1]
  def change
    create_table :species do |t|
      t.string :name
      t.string :scientific_name

      t.timestamps
    end
  end
end
