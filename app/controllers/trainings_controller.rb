class TrainingsController < ApplicationController

  def index
    if params[:search]
      @filter = params[:search][:modes].flatten.reject(&:blank?)
      @trainings = @filter.empty? ? Training.all : Training.all.tagged_with(@filter, any: true)
    else
      @trainings = Training.all
    end
  end

end
