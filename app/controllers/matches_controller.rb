class MatchesController < ApplicationController
before_action :user
before_action :set_match, only: [:new, :show, :decline, :accept, :edit, :create]

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(user: @user)
    @messages = @match.messages
    @sent_messages = @match.messages.where(user: current_user)
    @received_messages = @match.messages.where.not(user: current_user)
    @location = @match.location
  end

  def show
    @message = Message.new

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
    unless @match.user == current_user
      redirect_to search_path, alert: "Search for another friend"
    end
  end

  def match_params
    params.require(:match).permit(:status, :location_id, :user_id)
  end

