class UserController < ApplicationController
    skip_before_action :authenticate_request!, only: [:login, :create]
    require 'simple_jwt_auth'
    

    def index
        @user = User.all
        render json: @user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: 200
        else
            render json: @user.errors, status: :unprocessable_identity
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user, status: 200
        else
            render json: @user.errors, status: :unprocessable_identity
        end
    end

    def edit
        @user = User.find(params[:id])
        render json: @user
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: @user, status: :delete
        else
            render json: @user.errors, status: :unprocessable_identity
        end
    end

    def destroy_all
        @user = User.all
        if @user.destroy_all
            render plain: "Deletado com sucesso", status: 200
        else 
            render json: @user.errors, status: 422
        end
    end

    def login
        user = User.find_by(username: params[:username])

        if user&.authenticate(params[:password])
            token = SimpleJwtAuth::TokenProvider.new.call(user_id: user.id) 
            render json:  { token: token}, status: 200
        else
            render json: :error, status: :unauthorized
        end
    end
        

    private
    def user_params
        params.require(:user).permit(:name, :username, :password) 
    end

end