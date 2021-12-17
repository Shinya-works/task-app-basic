class TasksController < ApplicationController
  before_action :set_user_id
  before_action :logged_in_user
  before_action :correct_user, only: [ :index, :show, :new, :create, :destroy]
  before_action :correct_user_edit, only: [ :edit, :update]
  before_action :set_task, only: [ :show, :edit, :update ,:destroy]
  
  
  
    def index
      @tasks = @user.tasks.order("id DESC")
    end
    
    def show
    end
    
    def new
      @task = Task.new
    end
    
    def create
      @task = @user.tasks.new(task_params)
      if @task.save
        flash[:success] = "タスクの新規作成に成功しました。"
        redirect_to user_task_url(@user, @task)
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @task.update_attributes(task_params)
        flash[:success] = "タスクの更新に成功しました。"
        redirect_to user_task_url(@user, @task)
      else
        render :edit
      end
    end
    
    def destroy
      @task.destroy
      redirect_to user_tasks_url(@user)
    end
    
    private
    
      def task_params 
        params.require(:task).permit(:name, :detail)
      end
      
      def set_task
        @task = @user.tasks.find(params[:id])
      end
end
