require 'rails_helper'

RSpec.describe Specie, type: :model do
  # Association test
  it { should have_many(:pets).dependent(:destroy) }
  
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:scientific_name) }
  it { should validate_uniqueness_of(:scientific_name) }
end
