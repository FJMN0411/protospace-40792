class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{comment.prototype.id}"
  
    if @comment.save
      redirect_to @prototype
    else
      render "prototypes/#{comment.prototype.id}"
    end

    
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
