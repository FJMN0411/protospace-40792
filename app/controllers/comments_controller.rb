class CommentsController < ApplicationController

  def create
    unless comment_params[:content].blank?
      comment = Comment.create(comment_params)
      redirect_to prototype_path(params[:prototype_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end