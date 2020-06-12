class CommentsController < ApplicationController

  def new
  end

  def create
    puts "$" * 60
    puts params[:id]
    puts params[:training_id]
    puts "$" * 60
    @training = Training.find(params[:id])
    @comment = Comment.create(content: params[:content], user_id: current_user.id, item_id: @training.id)
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
  end

end
