class PetsController < ApplicationController
	def index
	end

	def show
	end

	def create
		Pet.create(:name => 'Pichuí')
	end
end
