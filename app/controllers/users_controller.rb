class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
     # render status: :ok, json: { notice: 'User created successfully' }
      redirect_to :action => 'index'
    else render :action => 'create', notice: 'Something went wrong'
    end
  end

  def delete
    @user = User.find(params[:id]).destroy
  end

  # private 

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
