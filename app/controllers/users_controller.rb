class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  
  def destroy
    @user.destroy
    redirect_to users_path, notice: "You have deleted the user!"
  end

  def new 
    if params[:back]
      @user = User.new(param_user)
    else
      @user = User.new
    end
  end

  def edit
  end

  def update
    if @user.update(param_user)
      redirect_to users_path, notice: "You have updated your user!"
    else
      render :edit
    end
  end

  def show
  end
  def confirm
    @user = User.new(param_user)
    render :new if @user.invalid?
  end

  def create
    @user = User.create(param_user)
    if @user.save
      redirect_to users_path, notice: "You have created new user!"
    else
      render :new
    end
  end

  private 
  def param_user
    params.require(:user).permit(:name, :email, :proffession, :Role, :password, :password_confirmation )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
