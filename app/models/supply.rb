class Supply < ApplicationRecord
	has_many :owned_items
	has_many :users, through: :owned_items
	has_many :groups, through: :users
end