class ActivitiesController < ApplicationController
  before_action :user


  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = @user
    if @activity.save
      redirect_to activities_path, notice: "Your activity was added"
    else
      render :new
    end
    @activity.save
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, notice: "Your activity was deleted"
  end

private

  def activity_params
    params.require(:activity).permit(:description, :location, :category, :time, :date, :image)
  end

  def user
    @user = current_user
  end

end
