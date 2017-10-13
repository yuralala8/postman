class Match < ApplicationRecord
	belongs_to :pet, foreign_key: "pet1_id", class_name: "Pet"
	belongs_to :pet, foreign_key: "pet2_id", class_name: "Pet"
	has_many :messages
	has_many :playdates
end
