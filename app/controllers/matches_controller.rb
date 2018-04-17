class MatchesController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

  def user
    @user = current_user
  end

  def set_match
    @match = Match.find(params[:id])
    unless @matches.user == current_user
      redirect_to home_path, alert: "You cannot alter this appointment."
    end
  end
  end

  def match_params
    params.require(:match).permit(:status, :location_id, :user_id)
  end
end
