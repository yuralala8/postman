class User < ApplicationRecord
	has_many :pets
	has_many :messages, through: :pets
	has_many :playdates, through: :pets
	has_secure_password
	validates :username, uniqueness: true
	validates :username, presence: true
	validates :password, presence: true
	validates :image, presence: true
	mount_uploader :image, ImageUploader
end
