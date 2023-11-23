class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password]) # if user exists and password is correct
            flash[:notice] = "Logged in successfully"
            redirect_to user
        else
            flash[:alert] = "There was something wrong with your login details"
            puts "Before render"
            render 'new'
            puts "After render"
        end
        
    end

    def destroy
    end
end