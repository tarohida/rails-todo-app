class TasksController < ApplicationController
  def index
    @task = Task.all
    @new_task = Task.new
  end

  def show
  end

  def new
    @task = Task.new
  end

  def task_params
    params.require(:task).permit(:title)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to action: "index"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to action: "index"
  end
end
