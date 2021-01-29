class Mission < ApplicationRecord
  belongs_to :users
  has_many :activities

  validates :name, :duration, :description, presence: true
end
