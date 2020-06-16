class SchoolsController < ApplicationController
  def new
    @school = School.new
  end

  def create
    School.create(name: params[:school][:name], website: params[:school][:website], creation_year: params[:school][:creation_year].to_i, campus_nb: params[:school][:campus_nb].to_i, siret: params[:school][:siret])
    @school = School.find_by(website: params[:school][:website])
    redirect_to new_school_training_path(@school.id)
  end

end
