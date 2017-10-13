class MatchesController < ApplicationController

	def index
		@matches = Match.where(pet1_id: session[:current_pet_id]) + Match.where(pet2_id: session[:current_pet_id])
	end
	
end
