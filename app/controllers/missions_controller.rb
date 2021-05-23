class MissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_mission, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @missions = current_user.missions
  end

  def show
  end

  def new
    @mission = Mission.new
  end

  def create

    @mission = Mission.new(mission_params)

    @mission.user = current_user
    if @mission.save
      redirect_to missions_path, notice: 'Successfully created'
    else

      flash.now[:alert] = 'Action failed'
      render :new
    end
  end

  def edit
  end

  def update
    if @mission.update(mission_params)
      redirect_to missions_path, notice: 'Successfully updated'
    else
      flash.now[:alert] = 'Action failed'
      render :edit
    end
  end
  
  def destroy
    @mission.destroy

    redirect_to missions_path, notice: 'Successfully deleted'
  end

  private

  def mission_params
    params.require(:mission).permit(:name, :description, :duration)
  end

  def find_mission
    @mission = Mission.find(params[:id])
  end

end
