class Pet < ApplicationRecord
	belongs_to :user
	belongs_to :breed
	has_many :swipes
	has_many :matches
	has_many :playdates, through: :matches
	has_many :messages, through: :matches
	validates :name, :breed, :gender, :age, presence: true
	mount_uploader :image, ImageUploader

	

	

	def find_correct_gender
		if self.gender.downcase == "male"
			Pet.where("pets.gender = 'Female'").to_a
		else
			Pet.where("pets.gender = 'Male'").to_a
		end
	end

	def find_correct_breed(pet)
		if pet.breed == self.breed
			return pet
		end
	end

	def find_pets_ids(session)
		correct_gender = self.find_correct_gender
		correct_pets = correct_gender.select {|pet| find_correct_breed(pet)}
		correct_pets.reject! do |pet|
			pet.user_id == session[:user_id]
		end
		correct_pets.map {|pet| pet.id}
	end
end
