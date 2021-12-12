class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = Task.order("id DESC")
    end
    
    def show
    end
    
    def new
      @task = Task.new
    end
    
    def create
      @task = Task.new(task_params)
      if @task.save
        flash[:success] = "タスクの新規作成に成功しました。"
        redirect_to @task
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @task.update_attributes(task_params)
        flash[:success] = "タスクの更新に成功しました。"
        redirect_to @task
      else
        render :edit
      end
    end
    
    def destroy
      @task.destroy
      redirect_to tasks_url
    end
    
    private
    
      def task_params
        params.require(:task).permit(:name, :deteil)
      end
      
      def set_task
        @task = Task.find(params[:id])
      end
end
