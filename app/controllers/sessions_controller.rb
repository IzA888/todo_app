class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]

  def new
  end

  def create 
    @user = User.find_by(username: params[:session][:username].downcase)
      if @user && user.authenticate(params[:sessio][:password])
        sign_in(@user)
      redirect_to @user
      else
        render json: @user.errors
      end
  end

  def destroy
      sign_out
    redirect_to root_url
  end
end
