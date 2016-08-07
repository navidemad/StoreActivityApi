class Store < ApplicationRecord
  has_many :visits, dependent: :destroy
  validates :name, presence: true, uniqueness: {scope: :address}, case_sensitive: false
end
