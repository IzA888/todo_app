class TaskController < ApplicationController
    def index 
        @tasks = Taks.all 
        render json: @tasks
    end

    def create(tasks, completed = False)
        if @tasks.save
            render json @tasks, status: :created
        else
            render json @tasks.errors, status: :unprocessable_identity
        end
    end

    def update(tasks)
        if @tasks.update
            render json @tasks, status: :updated
        else
            render json @tasks.errors, status: :unprocessable_identity
        end
    end

    def show
        @tasks = Taks.find(params[:id])
    end

    def delete
        if @tasks.delete
            render json @tasks, status: :deleted
        else
            render json @tasks.errors, status: :unprocessable_identity
        end
    end

end