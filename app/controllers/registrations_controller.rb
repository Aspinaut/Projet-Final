class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    # add custom create logic here
    #User.create(email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation], first_name:params[:first_name], last_name:params[:last_name])
  end

  def edit

  end

  def update
    super
    User.find(current_user.id). update(first_name:params[:user][:first_name], last_name:params[:user][:last_name])
  end



  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password)
    end
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password)
    end
end
