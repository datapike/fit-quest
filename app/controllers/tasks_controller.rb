class TasksController < ApplicationController
   
   before_action :set_task, only: [:edit, :update, :show]
   before_action :require_user 
   before_action :require_same_user, only: [:show, :edit, :update]
   before_action :require_admin, only: [:new, :create]
   
   def index
     @tasks = Task.all.order('task_name ASC')
      
    
   end
   
   def show
 
   end
   
   def new
       @task = Task.new
   end
   
   def create
      @task = Task.new(task_params)
      
      if @task.save
         flash[:success] = "Task has been added."
         redirect_to tasks_path
      else
         render 'new'
      end
   end
   
   def edit
       
   end
   
   def update
      if @task.update(task_params)
          flash[:success] = "Task has been updated."
          redirect_to tasks_path
      else
         render 'edit'
      end
   end
   
   def complete
    
    @user = current_user
    #@task = @user.task.id
    #@user.update(task_params)
    @task = Task.find(params[:id])
    @user.xp += @task.task_points
    @user.save
    
    #@user = current_user
    #@points = @task.task_points
    #@user.xp += @points
    #return current_user.xp
    
    flash[:success] = "Task has been completed."
    redirect_to tasks_path
   end
    
  private
   
   def task_params
      params.require(:task).permit(:id, :task_name, :task_points)
   end
   
    def set_task
      @task = Task.find(params[:id])
    end

   def require_same_user
    if current_user != @task.user && !current_user.admin?
      flash[:danger] = "You can only view and edit your own tasks"
      redirect_to tasks_path
    end
   end
   
end