# require 'rails_helper'
# require 'rspec_api_documentation/dsl'


# resource 'Species' do
#   header 'Content-Type', 'application/json'
#   explanation 'Little introduction about specie resource'

#   # initialize test data 
#   let!(:species) { create_list(:specie, 10) }
#   let(:id)       { species.first.id }

#   # index
#   get '/species' do
#     example 'Listing species' do
#       do_request

#       expect(json).not_to be_empty
#       expect(json.size).to eq(10)
#       expect(status).to eq(200)
#     end
#   end

#   # show
#   get '/species/:id' do
#     example 'Get a specie' do
#       explanation 'Get details from a specific specie as name etc'
#       do_request

#       expect(status).to eq(200)
#     end
#   end 

#   # create
#   post '/species' do
#     parameter :name, 'Specie name', 'Type': 'string', :required => :true
#     parameter :scientific_name, 'Specie scientific name', 'Type': 'string', :required => :true

#     let(:name) { 'Cat' }
#     let(:scientific_name) { 'Felis silvestris catus' }   

#     let(:raw_post) { params.to_json }

#     example 'Create a specie' do
#       explanation 'Create a new specie'

#       expect {
#         do_request
#       }.to change { Specie.count }.by(1)
      
#       expect(status).to eq(201)
#       expect(json['name']).to eq('Cat')
#     end
#   end

#   # update
#   put '/species/:id' do
#     parameter :name, 'Specie name', 'Type': 'string'
#     parameter :scientific_name, 'Specie scientific name', 'Type': 'string'

#     let(:name) { 'Cat' }
#     let(:scientific_name) { 'Felis silvestris catus' }  

#     let(:raw_post) { params.to_json }
#     example 'Update a specie' do
#       explanation 'Update details from a specific specie as name etc'
#       do_request

#       expect(status).to eq(204)
#     end
#   end 

#   # update - 404
#   put '/species/:id' do
#     let(:id) { 100 }

#     let(:raw_post) { params.to_json }

#     example 'Update a specie - 404', :document => false do
#       do_request

#       expect(status).to eq(404)
#     end
#   end

#   # delete
#   delete '/species/:id' do 
#     let(:raw_post) { params.to_json }
#     example 'Delete a specie' do
#       explanation 'Delete a specie'
#       do_request

#       expect(status).to eq(204)
#     end
#   end 
# end 