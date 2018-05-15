class InterestsController < ApplicationController
  before_action :set_user
  before_action :find_interest, only: [:show, :edit, :update, :destroy]

  def index
    @interests = Interest.all
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    @interest.user = @user
    if @interest.save
      flash[:notice] = "Interest saved successfully"
      redirect_to @interest.user
    else
      render :new
    end
    @interest.save
  end

  d

  def show
  end

  def edit
  end


  def update
    if @interest.update(interest_params)
      flash[:notice] = "Your interests were updated successfully"
      redirect_to @interest
    else
      flash.now[:danger] = "Error while submitting interests"
      render :edit
    end
  end

  def display
  @my_interests = current_user.user_interests_ids
    if @my_interests.any?
      @interests = Interest.select { |i| (i.user_interests_ids & @my_interests).any? }
    else
      @interests = Interest.all
    end
  end

  def destroy
    @interest.destroy
    redirect_to @user
  end

  private

  def set_user
    @user = current_user
  end

  def interest_params
    params.require(:interest).permit(:category, :user_interests_ids)
  end

  def find_interest
    @Interest = Interest.find(params[:id])
  end

end
