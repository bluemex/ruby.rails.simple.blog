class ArticlesController < InheritedResources::Base

    before_action :set_article, :only => [ :edit, :update, :destory]

    def index
        @articles = Article.includes(:user).page(params[:page]).per(5)
        # @articles = Article.page(params[:page]).per(5)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save

        redirect_to :action => :index
    end

    def show
        @article = Article.includes(:user).find(params[:id])
    end

    def edit

    end

    def update
        @article.update(article_params)

        redirect_to :action => :show, :id => @article
    end

    def destory
        @article.destory

        redirect_to :action => :index
    end

  private

    def article_params
      params.require(:article).permit(:title, :content, :user_id)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end

