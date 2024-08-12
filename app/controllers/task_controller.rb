class TaskController < ApplicationController
    def index 
        @tasks = Tasks.all
        render json: @tasks
    end

    def new
        @tasks = Tasks.new
    end

    def create
        @tasks = Tasks.new(tasks_params)
        if @tasks.save
            render json: @tasks, status: 200
        else
            render json: @tasks.errors, status: :unprocessable_identity
        end
    end

    def update
        @tasks = Tasks.find(params[:id])
        if @tasks.update(tasks_params)
            render json: @tasks, status: 200
        else
            render json: @tasks.errors, status: :unprocessable_identity
        end
    end

    def edit
        @tasks = Tasks.find(params[:id])
        render json: @tasks
    end

    def show
        @tasks = Tasks.find(params[:id])
        render json: @tasks
    end

    def destroy
        @tasks = Tasks.find(params[:id])
        if @tasks.destroy
            render json: @tasks, status: :delete
        else
            render json: @tasks.errors, status: :unprocessable_identity
        end
    end

    def destroy_all
        @tasks = Tasks.all
        if @tasks.destroy_all
            render plain: "Deletado com sucesso", status: 200
        else 
            render json: @tasks.errors, status: :unprocessable_identity
        end
    end
        

    private
    def tasks_params
        params.require(:task).permit(:title, :completed ) 
    end

end