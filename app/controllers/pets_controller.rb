class PetsController < ApplicationController
	before_action :get_pet_by_id, only: [:show, :update, :destroy]

	# GET /pets
	def index
		pets = Pet.all
		render json: pets, status: :ok
	end

  # GET /pets/:id
	def show
		render json: @pet, status: :ok
	end

	# POST /pets
	def create
		pet = Pet.create!(pet_params)
		render json: pet, status: :created
	end

	# PUT /pets/:id
  def update
    @pet.update!(pet_params)
		head :no_content
  end

  # DELETE /pets/:id
  def destroy
    @pet.destroy
    head :no_content
  end

	private
	def pet_params
    # whitelist params
    params.permit(:name, :specie_id)
  end

  def get_pet_by_id
  	not_found unless @pet = Pet.find_by_id(params[:id])
  end
end
