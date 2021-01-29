class Mission < ApplicationRecord
  belongs_to :users
  has_many :activities
end
