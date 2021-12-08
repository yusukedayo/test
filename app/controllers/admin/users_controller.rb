class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  def question
    @q = current_user.questions.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to admin_user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to admin_user_path(@user)
    else
        render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end

