class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
   # それぞれのユーザー情報を代入
    def set_user
      @user = User.find(params[:user_id])
    end 
    
    # ログイン済みのユーザーか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        store_location
        redirect_to login_url
      end
    end
    
    # ログイン規制
    def log_in_regulation
      if logged_in?
        flash[:success] = "すでにログインしています。"
        redirect_to current_user
      end
    end
    
    # 現在のログインしているユーザーが管理者か確認
    def admin_user
        redirect_to root_url unless current_user.admin?
    end
    
    # ログインユーザー本人の確認
    def correct_user
      @User = User.find(current_user.id)
      redirect_to root_url unless current_user?(@user)
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
