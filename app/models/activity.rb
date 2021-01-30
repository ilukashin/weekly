class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :mission

  validates :duration, presence: true
end
