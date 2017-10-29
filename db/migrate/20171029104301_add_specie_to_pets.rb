class AddSpecieToPets < ActiveRecord::Migration[5.1]
  def change
  	add_reference :pets, :specie, foreign_key: true
  end
end
