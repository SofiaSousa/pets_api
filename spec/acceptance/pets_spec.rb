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
  get '/pets/:id' do
    example 'Get a pet' do
      explanation 'Get details from a specific pet as name etc'
      do_request

      expect(status).to eq(200)
    end
  end 

  # create
  post '/pets' do
    parameter :name, 'Pet name', 'Type': 'string', :required => :true
    parameter :specie_id, 'Specie identification', 'Type': 'integer', :required => :true

    let(:name) { 'Pichuí' }
    let(:specie_id) { create(:specie).id }  

    let(:raw_post) { params.to_json }

    example 'Create a pet' do
      explanation 'Create a new pet'

      expect {
        do_request
      }.to change { Pet.count }.by(1)
      
      expect(status).to eq(201)
      expect(json['name']).to eq('Pichuí')
    end
  end

  # update
  put '/pets/:id' do
    parameter :name, 'Pet name', 'Type': 'string'
    parameter :specie_id, 'Specie identification', 'Type': 'integer'

    let(:name) { 'Pichuí II' }
    let(:specie_id) { create(:specie).id }  

    let(:raw_post) { params.to_json }
    example 'Update a pet' do
      explanation 'Update details from a specific pet as name etc'
      do_request

      expect(status).to eq(204)
    end
  end 

  # update - 404
  put '/pets/:id' do
    let(:id) { 100 }

    let(:raw_post) { params.to_json }

    example 'Update a pet - 404', :document => false do
      do_request

      expect(status).to eq(404)
    end
  end

  # delete
  delete '/pets/:id' do 
    let(:raw_post) { params.to_json }
    example 'Delete a pet' do
      explanation 'Delete a pet'
      do_request

      expect(status).to eq(204)
    end
  end 
end 