class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :mission

  validates :duration, presence: true
  validates :date, presence: true

  def self.to_chart_data(activities)
    return nil if activities.empty?

    data = activities.group(:mission_id).sum(:duration)
    data.transform_keys { |mission_id| Mission.find(mission_id).name }
  end

  def self.users_last_week(user, date_range)
    user.activities.where(date: date_range)
  end

end
