class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # byebug

  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit 
    # byebug
  end

  def create
    # render plain: params[:article] #this will render into browser after save

    @article = Article.new(article_params)
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

    if @article.update(article_params)
        flash[:notice] = "Article was updated successfully"
        redirect_to @article
    else
        render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to articles_path
  end

  private 

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
