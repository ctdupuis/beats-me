class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :authenticated
    helper_method :require_auth

    private

    def authenticated
        !!current_user
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_auth
        unless authenticated
            flash[:errors] = "Please log in to continue"
            redirect_to controller: "sessions", action: "new"
        end
    end

end
