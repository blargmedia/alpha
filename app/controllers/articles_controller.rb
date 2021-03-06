class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all

  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create

    #debugger

    #render plain: params[:article].inspect
    @article = Article.new(article_params)

    @article.user = User.first

    if @article.save
      #do something
      flash[:success] = "article created successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end

    #redirect_to article_path(@article)
  end

  def update
    if @article.update(article_params)
      flash[:success] = "article updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end

  def show

  end

  def destroy
    @article.destroy

    flash[:danger] = "article deleted"

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end
