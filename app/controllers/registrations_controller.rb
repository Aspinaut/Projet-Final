class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def edit
  end

  def update
    super
    User.find(current_user.id). update(first_name:params[:user][:first_name], last_name:params[:user][:last_name])
  end

  def destroy
    current_user.comments.destroy_all
    current_user.destroy
    redirect_to root_path
  end

  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password)
    end
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password)
    end
end
