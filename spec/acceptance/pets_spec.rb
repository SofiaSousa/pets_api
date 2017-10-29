require 'rails_helper'
require 'rspec_api_documentation/dsl'


resource 'Pets' do
  header 'Content-Type', 'application/json'
  explanation 'Little introduction about pet resource'

  # initialize test data 
  let!(:pets) { create_list(:pet, 10) }
  let(:id)    { pets.first.id }

  # index
  get '/pets' do
    example 'Listing pets' do
      do_request

      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(status).to eq(200)
    end
  end

  # show
  get 'pets/:id' do
    example 'Get a pet' do
      explanation 'Get details from a specific pet as name etc'
      do_request

      expect(status).to eq(200)
    end
  end 

  # create
  post 'pets' do
    parameter :name, 'Pet name', 'Type': 'string', :required => :true

    let(:name) { 'Pichuí' }  
    let(:specie_id) { Specie.create!(name: 'cat', scientific_name: 'Felis silvestris catus').id }  

    let(:raw_post) { params.to_json }

    example 'Create a pet' do
      explanation 'Create a new pet'
      do_request

      expect(status).to eq(201)
      expect(json['name']).to eq('Pichuí')
      expect(Pet.count).to eq(1)
    end
  end
end 