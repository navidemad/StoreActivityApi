class User < ApplicationRecord
  has_secure_password
  has_many :visits
  validates :username, presence: true, uniqueness: true
end
