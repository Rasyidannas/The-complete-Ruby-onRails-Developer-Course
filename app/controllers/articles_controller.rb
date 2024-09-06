class ArticlesController < ApplicationController
    def show
        # byebug
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
    end

    def create
        # render plain: params[:article] #this will render into browser after save

        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            redirect_to @article
        else
            render :new
        end

        # render plain: @article.inspect
    end
end