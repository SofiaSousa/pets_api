require 'rails_helper'

RSpec.describe Pet, type: :model do
	# Table index test
	it { should have_db_index(:specie_id) }

	# Association test
  it { should belong_to(:specie) }

	# Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:specie_id) }
end
