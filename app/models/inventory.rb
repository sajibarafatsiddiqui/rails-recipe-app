class Inventory < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :foods_inventories
  has_many :foods, through: :foods_inventories
end
