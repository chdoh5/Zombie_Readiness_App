class OwnedItem < ApplicationRecord
	belongs_to :user
	belongs_to :supply
	has_one :weapon, through: :user
	has_one :group, through: :user
	
end