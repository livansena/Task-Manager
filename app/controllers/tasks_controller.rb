class TasksController < ApplicationController
  # GET /
  def index
    @tasks = Task.all
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      # Se a validação falhar, renderiza a pág  ina index novamente
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/:id
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path
  end

  # DELETE /tasks/:id
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private

  # Método para sanitizar e permitir os parâmetros do formulário
  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
