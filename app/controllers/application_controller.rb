class ApplicationController < ActionController::API

    before_action :authenticate_request!, except: [:login, :create]

    def correct_user?
        @user = User.find(params[:id])
            unless current_user == @user
                    redirect_to users_path
            end
        end
end
