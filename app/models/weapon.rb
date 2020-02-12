class Weapon < ApplicationRecord
	belongs_to :user, optional: true
	has_one :group, through: :user
	has_many :owned_items, through: :user
	has_many :supplies, through: :owned_items

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :user_id, numericality: { only_integer: true }, allow_nil: true
	validates :readiness_value, presence: true
	validates :readiness_value, numericality: { only_integer: true }
	
end