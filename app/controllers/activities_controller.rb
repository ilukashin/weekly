class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_activity, only: [:show, :edit, :update, :destroy]

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
    if @activity.save!
      redirect_to activities_path, notice: 'Success'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity
    end
    
  end
  
  def destroy
    @activity.destroy

    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:duration, :mission_id)
  end

  def find_activity
    @activity = Activity.find(params[:id])
  end

end
