class ReviwCommentsController < ApplicationController
  def create
    reviw = Reviw.find(params[:reviw_id])
    comment = current_user.reviw_comments.new(reviw_comment_params)
    comment.reviw_id = reviw.id
    comment.save
    redirect_to reviw_path(reviw)
  end

  private

  def reviw_comment_params
    params.require(:reviw_comment).permit(:comment)
  end
end
