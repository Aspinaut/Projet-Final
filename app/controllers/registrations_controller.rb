class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    User.update(first_name:params[:user][:first_name], last_name:params[:user][:last_name])
    # add custom create logic here
    #User.create(email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation], first_name:params[:first_name], last_name:params[:last_name])
  end

  def update
    super
    User.update(first_name:params[:user][:first_name], last_name:params[:user][:last_name])
  end
end
