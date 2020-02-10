class Group < ApplicationRecord
	has_many :users
	has_many :weapons, through: :users
	has_many :supplies, through: :owned_items

end