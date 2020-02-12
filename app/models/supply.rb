class Supply < ApplicationRecord
	has_many :owned_items
	has_many :users, through: :owned_items
	has_many :groups, through: :users
	has_many :weapons, through: :users
	
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :readiness_value, presence: true
	validates :readiness_value, numericality: { only_integer: true }
	
end