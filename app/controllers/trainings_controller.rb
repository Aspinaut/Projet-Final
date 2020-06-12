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
    @comments = @training.comments
  end

end
