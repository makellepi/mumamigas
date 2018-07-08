class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?


  helper_method :matches

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo])
  end

  def after_sign_in_path_for(resource)
    @user = current_user
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

          if match_value > 0.3
            @matches_array << [match,match_value, join_categories]
          end
        end
      end
    end
  end

end



