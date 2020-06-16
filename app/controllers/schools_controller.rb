class SchoolsController < ApplicationController
  def new
  	@school = School.new
  end

  def create

	School.create(name: params[:school][:name], website: params[:school][:website],creation_year: params[:school][:creation_year],campus_nb: params[:school][:campus_nb],siret: params[:school][:siret])
    redirect_to '/'


  end
end
