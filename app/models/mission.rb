class Mission < ApplicationRecord
  belongs_to :user
  has_many :activities

  validates :name, :duration, :description, presence: true
end
