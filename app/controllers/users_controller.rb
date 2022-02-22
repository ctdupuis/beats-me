class UsersController < ApplicationController
    
    def create
        
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

end
