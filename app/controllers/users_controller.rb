class UsersController < ApplicationController

  before_action :fetch_user, only: [:index, :show, :edit]

  def new
    @user = User.new
  end

  def index

  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = 'success'
      redirect_to users_path
    else
      flash[:alert] = @user.errors.full_messages.join('')
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'success'
      redirect_to @user
    else
      render 'edit'
    end

  end

  def destroy
    @user = user.find(params[:id])
    @user.destroy
    flash[:notice] = 'success'
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Use callbacks to share common setup or constraints between actions.


  # Never trust parameters from the scary internet, only allow the white list through.

  #确保是正确用户
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  #确保是管理员
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  private
  def user_params
    params.require(:user).permit(:name, :password_digest, :mobile)
  end

  def fetch_user
    @user = User.find(params[:id])
  end

end
