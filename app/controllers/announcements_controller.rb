class AnnouncementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_announcement, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :vote]
  respond_to :js, :json, :html
  def index
    @announcements = Announcement.order('created_at DESC').page(params[:page])
  end
  
  def destroy
    @announcement.destroy
    redirect_to announcements_path, notice: "You have deleted the announcement!"
  end

  def new 
    if params[:back]
      @announcement = Announcement.new(param_announcement)
    else
      @announcement = Announcement.new
    end
  end

  def edit
  end

  def update
    if @announcement.update(param_announcement)
      redirect_to announcements_path, notice: "You have updated your announcement!"
    else
      render :edit
    end
  end

  def show
      @comments = @announcement.comments
      @comment = @announcement.comments.build
  end
  def confirm
    @announcement = Announcement.new(param_announcement)
    render :new if @announcement.invalid?
  end

  def create
    @announcement = Announcement.create(param_announcement)
    if @announcement.save
      redirect_to announcements_path, notice: "You have created new announcement!"
    else
      render :new
    end
  end
  def vote
    if !current_user.liked? @announcement
      @announcement.liked_by current_user
    elsif current_user.liked? @announcement
      @announcement.unliked_by current_user
    end
  end
  def upvote
    @announcement.upvote_from current_user
    redirect_to announcements_path
  end
  def downvote
    @announcement.downvote_from current_user
    redirect_to announcements_path
  end
  private 
  def param_announcement
    params.require(:announcement).permit(:title, :text, :user_id, :owners )
  end

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end
end
