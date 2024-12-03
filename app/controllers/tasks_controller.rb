class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
def index
  @user = User.find(params[:user_id])
   @tasks = @user.tasks
end

def new
  @user = User.find(params[:user_id])
  @task = Task.new
end

def show
  @user = User.find(params[:user_id])
  @task = Task.find_by(id: params[:id], user_id: params[:user_id])

  if @task.nil?
    redirect_to user_tasks_path(params[:user_id]), alert: "Task not found."
  end
end

def create
  @user = User.find(params[:user_id])
  @task = @user.tasks.new(task_params)
  @task.user_id = @user.id

  if @task.save!
    redirect_to user_tasks_path(@user), notice: 'Task created successfully.'
  else render :action => 'new'
  end
end

def update
  @task = Task.find(params[:id])
end

def destroy
  @user = User.find(params[:user_id])
  @task = @user.tasks.find_by(id: params[:id])
  
  if @task
    @task.destroy
    redirect_to user_tasks_path(@user), notice: 'Task deleted successfully.'
  else
    redirect_to user_tasks_path(@user), alert: 'Task not found.'
  end
end

private 

def task_params
  params.require(:task).permit(:user_id, :title, :description, :priority, :status, :due_date)
end
end
