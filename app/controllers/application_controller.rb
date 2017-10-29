class ApplicationController < ActionController::API
	def not_found
		render json: { message: 'Not Found' }, status: :not_found
	end
end
