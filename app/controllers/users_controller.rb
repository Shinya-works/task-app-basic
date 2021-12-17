class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [ :index, :show, :edit, :update, :destroy]
  before_action :admin_user, only: [ :index]
  before_action :correct_user, only: [ :edit, :update]
  before_action :admin_or_correct_user, only: [ :show]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def show
  end

  def new
    @user = User.new
  end
  # ログイン済みのユーザーか確認
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "新規作成に成功しました。"
      redirect_to @user
    else
      flash.now[:danger] = '認証に失敗しました。'
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
    
    # 管理者またはログインユーザー本人であるかの確認
    def admin_or_correct_user
      @user = user.find(params[:id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません"
        redirect_to root_url
      end
    end
end
