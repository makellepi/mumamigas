class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create, :new]

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
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
    params.require(:user).permit(:first_name, :second_name, :children, :children_age, :age, :bio, :work_status, :photo, :language)
  end

end

