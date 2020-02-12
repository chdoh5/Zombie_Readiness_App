class Group < ApplicationRecord
	has_many :users
	has_many :weapons, through: :users
	has_many :owned_items, through: :users
	has_many :supplies, through: :owned_items

	validates :name, presence: true
	validates :name, uniqueness: true

	def readiness
		supply_score + weapon_score
	end 

	def supply_score 
		readiness_score = 0
		self.users.each do |user|
			user.supplies.each do |supply|
				readiness_score += supply.readiness_value 
			end 
		end 
		readiness_score / self.users.count
	end 

	def weapon_score
		weapon_score = 0
		self.users.each do |user|
			user.weapons.each do |weapon|
				weapon_score += weapon.readiness_value
			end 
		end 
		return weapon_score
	end 

end