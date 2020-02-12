class User < ApplicationRecord
	has_secure_password
	validates_presence_of :name
  	validates_uniqueness_of :name
  	validates_presence_of :password_digest

	belongs_to :group
	has_many :weapons
	has_many :owned_items
	has_many :supplies, through: :owned_items

	
end