class CommentsController < ApplicationController
  before_action :find_announcement
 before_action :find_comment, only: [:destroy, :edit , :update]
def create
@comment = @announcement.comments.create(params[:comment].permit(:content))
@comment.save
if @comment.save
  redirect_to announcement_path(@announcement)
else
  redirect_to announcement_path(@announcement), notice: "failed to post..."
end
end

def destroy
@comment.destroy
redirect_to announcement_path(@announcement)
end

def edit

end
def update
  if @comment.update(params[:comment].permit(:content))
    redirect_to announcement_path(@announcement)
    else
      render 'edit'
    end
  end
  private
def find_announcement
  @announcement= Announcement.find(params[:announcement_id])
end

def find_comment
  @comment = @announcement.comments.find(params[:id])
end


end

