class TaskController < ApplicationController
    require 'simple_jwt_auth'
    before_action :authenticate_request!

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
            render json: @tasks.errors, status: 422
        end
    end

    def update
        @tasks = Tasks.find(params[:id])
        task_params = params.require(:task).permit(:title, :completed)
        if @tasks.update(task_params)
            render json: @tasks, status: 200
        else
            render json: @tasks.errors, status: 422
        end
    end

    def edit
        @tasks = Tasks.find(params[:title])
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
            render json: @tasks.errors, status: 422
        end
    end

    def destroy_all
        @tasks = Tasks.all
        if @tasks.destroy_all
            render plain: "Deletado com sucesso", status: 200
        else 
            render json: @tasks.errors, status: 422
        end
    end
        

    private
    def tasks_params
        params.require(:task).permit(:title) 
    end

    def authenticate_request!
        auth_header = request.headers['Authorization']

        
        if auth_header.present?
            # Remove o prefixo "Bearer " e deixa apenas o token
            token = auth_header.split(' ').last
            # Agora você pode usar o token para autenticação
            SimpleJwtAuth::TokenProvider.decode(token)
          else
            render json: { error: 'Missing token' }, status: 401
          end
    end

end