class SpeciesController < ApplicationController
	before_action :get_specie_by_id, only: [:show, :update, :destroy]

	# GET /species
	def index
		species = Specie.all
		render json: species, status: :ok
	end

  # GET /species/:id
	def show
		render json: @specie, status: :ok
	end

	# POST /species
	def create
		specie = Specie.create!(specie_params)
		render json: specie, status: :created
	end

	# PUT /species/:id
  def update
    @specie.update!(specie_params)
		head :no_content
  end

  # DELETE /species/:id
  def destroy
    @specie.destroy
    head :no_content
  end

	private
	def specie_params
    # whitelist params
    params.permit(:name, :scientific_name)
  end

  def get_specie_by_id
  	not_found unless @specie = Specie.find_by_id(params[:id])
  end
end
