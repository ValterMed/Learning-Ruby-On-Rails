class ArticlesController < ApplicationController
  before_action :load_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  
  def index
    @articles = Article.all
  end

  def show ; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "article created" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { redirect_to :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "article updated" }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'article deleted'
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def load_article
    @article = Article.find(params[:id])
  end
end
