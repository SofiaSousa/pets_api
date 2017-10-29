class Specie < ApplicationRecord
	# model association
  has_many :pets, dependent: :destroy
  
  # validations
  validates_presence_of :name, :scientific_name
  validates_uniqueness_of :name
  validates_uniqueness_of :scientific_name
end
