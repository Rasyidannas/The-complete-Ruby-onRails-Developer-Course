class ArticlesController < ApplicationController
    def show
        # byebug
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit 
        # byebug
        @article = Article.find(params[:id])
    end

    def create
        # render plain: params[:article] #this will render into browser after save

        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            render "new"
        end

      # render plain: @article.inspect
    end

    def update
        # byebug
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end
end
