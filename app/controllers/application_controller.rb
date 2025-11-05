class ApplicationController < ActionController::API
    # proteção CSRF
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :exception

    include SessionsHelper

    before_action :authenticate_request!, except: [:new, :login, :create]

    def correct_user?
        @user = User.find(params[:id])
            unless current_user == @user
                    redirect_to users_path
            end
        end
end
