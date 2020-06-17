class CommentsController < ApplicationController

  def new

  end

  def create
    if current_user
      @comment = Comment.new(content: params[:content],user_id: current_user.id, training_id: params[:training_id])
      if @comment.save
        flash[:success] = "The comment has been added."
        redirect_to school_training_path(Training.find(params[:training_id]).school_id, params[:training_id])
      else
        flash[:danger] = "The comment has not been added."
        redirect_to school_training_path(Training.find(params[:training_id]).school_id, params[:training_id])
      end
    else
      flash[:danger] = "Connect to comment."
      redirect_to new_user_registration_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])

  end

  def update
    @comments = Comment.all
    @comment = Comment.find(params[:id])
    @training = Training.find(@comment.training.id)
    if current_user
      @comment.update(content: params[:content])
      if @comment.save
        flash[:success] = "The comment has been edited."
        redirect_to school_training_path(params[:school_id], params[:training_id])
      else
        flash[:danger] = "The comment has not been edited."
        redirect_to school_training_path(params[:school_id], params[:training_id])
      end
    else
      flash[:danger] = "Connect to edit."
      redirect_to new_user_registration_path
    end
  end

  def index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "The comment has been deleted."
    redirect_to school_training_path(Training.find(params[:training_id]).school_id, params[:training_id])
  end

end
