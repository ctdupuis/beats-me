class SessionsController < ApplicationController
    layout "sessions"

    def new
    end

    def create
        if auth_hash = request.env['omniauth.auth']
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id 
            redirect_to my_page_path
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to my_page_path
            else
                flash[:errors] = "Invalid username/password. Please try again"
                render 'new'
            end
        end
    end

    def destroy
        session.delete :user_id 
        redirect_to root_path
    end

    def guest
        session[:user_id] = User.find_by(username: 'Guest').id
        redirect_to my_page_path
    end


end