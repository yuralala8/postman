class Swipe < ApplicationRecord
	belongs_to :swiper, foreign_key: "swiper_id", class_name: "Pet"
	belongs_to :swipee, foreign_key: "swipee_id", class_name: "Pet"

	def perfect_match?(swipe_params)
		swipee_swipes = Swipe.where(swiper_id: swipe_params[:swipee_id])
		perfect_match = swipee_swipes.find_by(swipee_id: swipe_params[:swiper_id])

		if perfect_match
			Match.create(pet1_id: swipe_params[:swipee_id].to_i, pet2_id: swipe_params[:swiper_id].to_i)
			matched_pet = Pet.find_by(id: swipe_params[:swipee_id])
			"You matched with #{matched_pet.name} 💕"
		end
	end
end
