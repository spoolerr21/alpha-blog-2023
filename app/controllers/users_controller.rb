class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def create
        @user = User.new(user_params) # we need to define user_params method below
        if @user.save
            session[:user_id] = @user.id # save user id in session
            flash[:notice] = "Welcome to Alpha Blog #{@user.username}, You have successfully signed up"
            redirect_to articles_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

        def set_user
            @user = User.find(params[:id])
        end
end
