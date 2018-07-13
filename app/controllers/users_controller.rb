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

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    @follow = Follow.find_by(follower: current_user, followable: @user)
    respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js  # <-- will render `app/views/reviews/follow.js.erb`
    notification = Notification.create target: @user, object: current_user, type: 'follow'

    end
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js  # <-- will render `app/views/reviews/unfollow.js.erb`
    notification = Notification.create target: @user, object: current_user, type: 'unfollow'

    end
  end

  def matches
    @user = current_user
    if @user.interest_category != nil
      @user_matches = User.where(city: @user.city)
      if @user.interest_category.nil? || @user.interest_category == "[\"\"]"
        return "Plese complete your profile to get matches"
      elsif @user_matches != nil
        real_matches = []
        @user_matches.each do |match|
          if match != @user && match.interest_category != nil
            real_matches << match
          end
        end

        @matches_array = []

        real_matches.each do |match|
          match_real_categories = match.interest_category.gsub(/[~;:"'<>?#\s\]\\\[]+/, '').split(",")
          user_real_categories = @user.interest_category.gsub(/[~;:"'<>?#\s\]\\\[]+/, '').split(",")
          join_categories = match_real_categories & user_real_categories
          join_length = join_categories.length

          if join_categories.length == 0
            match_value = 0
          elsif match_real_categories.sort == user_real_categories.sort
            match_value = 1
          else
            match_value = join_categories.length.to_f*2 / (user_real_categories.length.to_f + match_real_categories.length.to_f)
          end

          if match.pregnant == @user.pregnant
            match_value = match_value*1.05
          end

          if @user.children == 0 and match.children > 0
            match_value = match_value*1.1
          end

          if match_value > 1
            match_value = 1
          end

          @matches_array << [match,match_value, join_categories]
        end
      end
    end
  end

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

