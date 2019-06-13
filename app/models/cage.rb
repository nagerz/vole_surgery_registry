class Cage < ApplicationRecord
  has_many :voles

  validates :card_id, presence: true, uniqueness: true
  validates :cage_id, presence: true, uniqueness: true
  validates :species, presence: true
  validates :type, presence: true
end
