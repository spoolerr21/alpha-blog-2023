class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password]) # if user exists and password is correct
            session[:user_id] = user.id # save user id in session
            flash[:notice] = "Logged in successfully"
            redirect_to user
        else
            flash[:alert] = "There was something wrong with your login details"
            redirect_to login_path
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end
