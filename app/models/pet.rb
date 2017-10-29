class Pet < ApplicationRecord
	# Model association
  belongs_to :specie

  # Validations
	validates_presence_of :name
	validates_presence_of :specie_id
end
