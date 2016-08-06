class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :store
  validates :report, presence: true
  validates :user, presence: true
end
