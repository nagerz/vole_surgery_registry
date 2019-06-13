class Experiment < ApplicationRecord
  belongs_to :user
  has_many :experiment_voles

  validates :title, presence: true, uniqueness: true
end
