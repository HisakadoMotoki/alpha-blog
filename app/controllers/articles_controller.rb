class ArticlesController < ApplicationController
before_action :set_article, only: [:edit, :update, :show, :destroy] 

def new
  @article = Article.new
end

def index
  @articles = Article.all
end

def edit
end

def destroy
  @article.destroy
flash[:notice] = "Article was deleted"
  redirect_to articles_path
end

def update
  if @article.update(article_params)
    flash[:notice] = "Article was successfilly updated"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end


def create 
  @article = Article.new(article_params)
  if @article.save
    flash[:notice] = "Article was successfilly created"
    redirect_to article_path(@article)
  else
    render 'new'
  end

end

def show
end

private
def article_params
  params.require(:article).permit(:title, :description)
end

def set_article
  @article = Article.find(params[:id])
end

end