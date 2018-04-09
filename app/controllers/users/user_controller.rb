 before_action :set_user, only: [:show, :edit, :update, :destroy, :create]
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

