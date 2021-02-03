class ChartService

  def self.week_chart(activities)
    return nil if activities.empty?

    data = activities.group(:mission_id).sum(:duration)
    data.transform_keys { |mission_id| Mission.find(mission_id).name }
  end

  def self.total_weekly_spent(activities)
    return Time.new(0) if activities.empty?

    Time.parse(activities.sum(:duration))
  end
end
