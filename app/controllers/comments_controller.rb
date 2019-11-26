class CommentsController < ApplicationController
  def create
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to announcement_path(@announcement), notice: 'Post failed please try again later...' }
      end
    end
  end
  
    private
    def comment_params
      params.require(:comment).permit(:announcement_id, :content)
    end
end
