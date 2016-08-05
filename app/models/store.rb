class Store < ApplicationRecord
  has_many :visits, dependent: :destroy
  validates :name, presence: true, uniqueness: true, case_sensitive: false
end
