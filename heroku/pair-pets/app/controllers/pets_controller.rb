class PetsController < ApplicationController
	before_action :require_login

	def index
		@pets = Pet.where(user_id: session[:user_id])
		session[:current_pet_id] = nil
	end

	def new
	end

	def create
		if pet_params[:breed][:name].present?
			@breed = Breed.create(name: pet_params[:breed][:name].downcase.titleize)
			@pet = Pet.new(name: pet_params[:name], gender: pet_params[:gender], age: pet_params[:age], description: pet_params[:description], image: pet_params[:image])
			@pet.breed = @breed
		else
			@pet = Pet.new(name: pet_params[:name], breed_id: pet_params[:breed_id], gender: pet_params[:gender], age: pet_params[:age], description: pet_params[:description], image: pet_params[:image])
		end
		
		@pet.user_id = session[:user_id]

		if @pet.save
			redirect_to pets_path
		else
			render :new
		end
	end

	def edit
		@pet = Pet.find(params[:id])
	end

	def update
		@pet = Pet.find(params[:id])
		@pet.update(name: pet_params[:name], breed_id: pet_params[:breed_id], gender: pet_params[:gender], age: pet_params[:age], description: pet_params[:description], image: pet_params[:image])
		redirect_to pets_path
	end

	def destroy
		@pet = Pet.find(params[:id])
		@matches = Match.where(pet1_id: @pet.id).destroy_all
		@other_matches = Match.where(pet2_id: @pet.id).destroy_all
		@pet.destroy
		redirect_to pets_path
	end


	private

	def pet_params
		params.require(:pet).permit(:name, :breed_id, :gender, :age, :description, :image, breed: [:name])
	end
end
