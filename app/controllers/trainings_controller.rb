class TrainingsController < ApplicationController

  def index
    if params[:search]
      @filter = params[:search][:modes].concat(params[:search][:durations]).flatten.reject(&:blank?)
      # puts "$" * 60
      # puts params[:search][:modes].count
      # puts params[:search][:durations].count
      # puts "$" * 60
      if @filter.empty?
        @trainings = Training.all
      elsif @filter.count == 1
        @trainings = Training.all.tagged_with(@filter, any: true)
      elsif @filter.count > 1
        # if params[:search][:modes].count > 1 && params[:search][:durations].count == 0
        #   @trainings = Training.all.tagged_with(@filter, any: true)
        # elsif params[:search][:durations].count > 1 && params[:search][:modes].count == 0
        #   @trainings = Training.all.tagged_with(@filter, any: true)
        # elsif params[:search][:durations].count >= 1 && params[:search][:modes].count >= 1
        @trainings = Training.all.tagged_with(@filter, match_all: true)
        # end
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

  # modifier l'attribut "school_id" qui est par défault à 1 !!
  def create
    Training.create(school_id: 1, name: params[:training][:name] ,duration: params[:duration].to_i, description: params[:training][:description], hours_per_day: params[:hours_per_day].to_i,url: params[:training][:url], mode: params[:mode], help_for_a_job: true?(params[:help_for_a_job]) )
    redirect_to '/'
  end

private 
  def true?(obj)
    obj == "true"
  end

end
