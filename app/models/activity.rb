class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :mission

  validates :duration, presence: true

  def self.week_chart(user)
    data = users_last_week(user).group(:mission_id).sum(:duration)
    data.transform_keys { |mission_id| Mission.find(mission_id).name }
  end

  def self.weekly_spent(user)
    time_str = users_last_week(user).sum(:duration)
    Time.parse(time_str)
  end

  def self.users_last_week(user)
    user.activities.where("created_at >= ?", 1.week.ago.utc)
  end
end
