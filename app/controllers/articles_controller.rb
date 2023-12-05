class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        # render plain: @article.inspect
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
            # redirect_to article_path(@article)
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @article.destroy
        puts "I am in destroy method"
        params[:id] = nil
        flash[:notice] = "Article has been deleted"
        redirect_to :action => :index
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end
