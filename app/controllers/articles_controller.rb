class ArticlesController < InheritedResources::Base

    before_action :authenticate_user!, except: [ :index, :show]
    before_action :set_article, :only => [ :show, :edit, :update, :destory]

    def index
        @articles = Article.includes(:user).order("updated_at desc").page(params[:page]).per(5)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        @article.save

        redirect_to :action => :index
    end

    def show
    end

    def edit

    end

    def update
        @article.update(article_params)

        redirect_to :action => :show, :id => @article
    end

    def destroy
        @article.destroy

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

