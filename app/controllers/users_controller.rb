class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create, :new]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:alert] = "Profile could not be updated."
      render :edit
    end
  end


  def destroy
    @user.destroy
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :second_name, :children, :children_age, :age, :bio, :work_status, :photo, :language, :user_interest)
  end

end

