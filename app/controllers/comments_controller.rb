class CommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(content: comment_params[:content], owner_id: current_user.id)
    if @comment.save
      redirect_to user_photo_path(@photo.owner_id, @photo)
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
