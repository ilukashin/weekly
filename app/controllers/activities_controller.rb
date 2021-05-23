class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_activity, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @activities = current_user.activities
  end

  def show
  end

  def new
    @activity = Activity.new
    @activity.user = current_user
  end

  def create

    @activity = Activity.new(activity_params)

    @activity.user = current_user
    if @activity.save
      redirect_to chart_path, notice: 'Successfully created'
    else
      flash.now[:alert] = 'Action failed'
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to chart_path, notice: 'Successfully updated'
    else
      flash.now[:alert] = 'Action failed'
      render :edit
    end
  end
  
  def destroy
    @activity.destroy

    redirect_to chart_path, notice: 'Successfully deleted'
  end

  private

  def activity_params
    params.require(:activity).permit(:duration, :mission_id, :date)
  end

  def find_activity
    @activity = Activity.find(params[:id])
  end

end
