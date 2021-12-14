class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  # ログイン済みのユーザーか確認
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
    
  def edit
  end
    
  def update
    if @user.update_attributes(user_params)
        flash[:success] = "ユーザー情報を更新しました。"
        redirect_to @user
    else
      render :edit      
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  
  private
  
    # ストロングパラメータcreate、updateを許可する
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # それぞれのユーザー情報を代入
    def set_user
      @user = User.find(params[:id])
    end 
    
    # ログイン済みのユーザーか確認
    def logged_in_user?
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
end
