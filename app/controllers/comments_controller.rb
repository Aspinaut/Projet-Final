class CommentsController < ApplicationController

  def new

  end

  def create
    if current_user
      @comment = Comment.new(content: params[:content],user_id: current_user.id, training_id: params[:training_id])
      if @comment.save
        flash[:success] = "The comment has been added."
        redirect_to training_path(params[:training_id])
      else
        flash[:danger] = "The comment has not been added."
        redirect_to training_path(params[:training_id])
      end
    else
      flash[:danger] = "Connect to comment."
      redirect_to new_user_registration_path
    end
  end

  def index
  end

  def destroy
    @training = Training.find(params[:training_id])
    @comment = Comment.find(params[:id])
  end

end
