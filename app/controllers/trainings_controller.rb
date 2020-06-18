class TrainingsController < ApplicationController

  def index

    if params[:search]
      @filter = params[:search][:modes].concat(params[:search][:durations]).concat(params[:search][:prices]).flatten.reject(&:blank?)
      if @filter.empty?
        @trainings = Training.all
      elsif @filter.count == 1
        @trainings = Training.all.tagged_with(@filter, any: true)
      elsif @filter.count == 2
        @trainings = Training.all.tagged_with(@filter)
      elsif @filter.count == 3
        @trainings = Training.all.tagged_with(@filter, match_all: true)
      end
    else
      @trainings = Training.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end


  def show
    @training = Training.find(params[:id])
    @sessions = @training.sessions
    @programs = @training.programs
    @comments = @training.comments
  end

  def new

  end

  def create
    Training.create(school_id: params[:school_id], name: params[:training][:name] ,duration: params[:duration].to_i, description: params[:training][:description], hours_per_day: params[:hours_per_day].to_i,url: params[:training][:url], mode: params[:mode], help_for_a_job: true?(params[:help_for_a_job]) )
    redirect_to root_path
  end

private
  def true?(obj)
    obj == "true"
  end

end
