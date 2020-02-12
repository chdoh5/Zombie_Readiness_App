class OwnedItem < ApplicationRecord
	belongs_to :user
	belongs_to :supply
	has_one :weapon, through: :user
	has_one :group, through: :user
	
	validates :user_id, presence: true
	validates :user_id, numericality: { only_integer: true }
	validates :supply_id, presence: true
	validates :supply_id, numericality: { only_integer: true }
	
end