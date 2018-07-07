class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create, :new, :index]

  def new
    @user = User.new
  end

  def index
    if params[:query].present?
      sql_query = "interest_category ILIKE :query OR city ILIKE :query"

      @users = User.where(sql_query, query: "%#{params[:query].gsub(/[~;:"'<>?#\s\]\\\[]+/, '')}%")

    else
      @users = User.all
    end
  end

  # Moved the Matches method to the Application Controller so to be able to call it inside the Show method

  def show
    # Calling the Matches method inside the Show method, so we can see the user matches at the Show page.
    matches
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
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :second_name, :children, :children_age, :age, :bio, :work_status, :photo, {language: []}, {interest_category: []}, :city, :pregnant, :pregnantdue)
  end

end

