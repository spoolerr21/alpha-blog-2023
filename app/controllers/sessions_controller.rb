class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password]) # if user exists and password is correct
            flash[:notice] = "Logged in successfully"
            redirect_to user
        else
            puts "combination of username and password is incorrect"
            # flash message is not working for render, we need to use flash.now
            flash.now[:alert] = "Invalid email/password combination" # Add flash message for invalid login
            render 'new'
        end
    end

    def destroy
    end
end
