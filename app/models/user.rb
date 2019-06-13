class User < ApplicationRecord
  has_secure_password

  enum role: [:researcher, :admin]

  has_many :experiments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, require: true
  validates_presence_of :location, :state
end