class Playdate < ApplicationRecord
	belongs_to :match
	validates :location, :date, presence: true
end
