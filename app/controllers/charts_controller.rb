class ChartsController < ApplicationController
  before_action :authenticate_user!

  def chart
    @activities = Activity.users_last_week(current_user, week_daterange)
    @chart_data = Activity.to_chart_data(@activities)
  end

  private

  def week_daterange
    return Date.today.at_beginning_of_week..Date.today.end_of_week unless params[:start_date]

    start_date = params.fetch(:start_date, Date.today).to_date
    start_date.beginning_of_week..start_date.end_of_week
  end

end
