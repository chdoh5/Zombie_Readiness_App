class User < ApplicationRecord
	belongs_to :group
	has_many :weapons
	has_many :owned_items
	has_many :supplies, through: :owned_items

	# accepts_nested_attributes_for :supply_ids

end