class MatchesController < ApplicationController
before_action :user
before_action :set_match, only: [:new, :show, :decline, :accept, :edit, :create]

  def new
    @match = Match.new
  end

  def create
     @match = Match.new(user: @user)
  end

  def update
  end

  def edit
  end


  def show
  end


  private

  def user
    @user = current_user
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:status, :location_id, :user_id)
  end

