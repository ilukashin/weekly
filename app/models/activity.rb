class Activity < ApplicationRecord
  belongs_to :users
  belongs_to :missions

  validates :duration, presence: true
end
