class TasksController < ApplicationController

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
  @task = Task.find(params[:id])
end

def create
  @user = User.find(params[:user_id])
  @task = @user.tasks.new(task_params)

  if @task.save!
    redirect_to user_tasks_path(@user), notice: 'Task created successfully.'
  else render :action => 'new'
  end
end

def update
  @task = Task.find(params[:id])
end

def destroy
  @task = Task.find(params[:id]).destroy
  redirect_to :action => 'index'
end

private 

def task_params
  params.require(:task).permit(:user_id, :title, :description, :priority, :status, :due_date)
end
end
