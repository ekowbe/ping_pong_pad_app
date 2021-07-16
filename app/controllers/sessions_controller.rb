class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by_username(params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            flash[:message] = "Successfully signed in"
            session[:user_id] = @user.id
            redirect_to fixtures_path
        else
            flash[:message] = "Invalid username and/or password"
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to fixtures_path
    end
end
