class SchoolsController < ApplicationController

  def new
    @school = School.new
    if signed_in?
      if current_user.is_school === true
        redirect_to new_school_training_path(:school_id)
      end
    else
      redirect_to new_user_registration_path, info: "Pour renseigner vos formations en temps qu'école vous devez vous connecter ou vous inscrire."
    end
  end

  def create
    School.create(name: params[:school][:name], website: params[:school][:website], creation_year: params[:school][:creation_year].to_i, campus_nb: params[:school][:campus_nb].to_i, siret: params[:school][:siret], user_id: current_user.id)
    become_a_school
    @school = School.find_by(website: params[:school][:website])
    redirect_to new_school_training_path(@school.id), success: "Ce compte est désormais un compte École !"
  end

  private
  def become_a_school
    current_user.update(is_school: true)
  end


end
