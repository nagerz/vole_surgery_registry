class Vole < ApplicationRecord
  belongs_to :cage
  has_many :experiment_voles

  validates :animal_id, presence: true, uniqueness: true
  validates :sex, presence: true
  validates :dob, presence: true
end
