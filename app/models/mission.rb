class Mission < ApplicationRecord
  belongs_to :user
  has_many :activities

  validates :name, :duration, presence: true
end
