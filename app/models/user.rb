class User < ApplicationRecord
  #has_many :experiments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: [:registered, :admin]
  enum activation_status: [:active, :inactive]
end
