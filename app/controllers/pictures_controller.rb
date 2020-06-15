class PicturesController < ApplicationController
  def create
    if params[:picture]
      @user = current_user
      @user.picture.attach(params[:picture])
      redirect_to edit_user_password_path
      flash[:success] = "Votre image de profil a été mise à jour."
    else
      flash[:danger] = "Vous n'avez pas inséré d'image."
      redirect_to edit_user_password_path
    end
  end
end
