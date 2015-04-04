class ArticlesController < InheritedResources::Base

    before_action :authenticate_user!, except: [ :index, :show]
    before_action :set_article, :only => [ :show]
    before_action :set_current_user_article, :only => [ :edit, :update, :destroy]

    def index
        @articles = Article.includes(:user).order("updated_at desc").page(params[:page]).per(5)
    end

    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.new(article_params)
        if @article.save
            redirect_to :action => :index
        else
            render :action => :new
        end
    end

    def show
        @comment = Comment.new
    end

    def edit

    end

    def update
        if @article.update(article_params)
            redirect_to :action => :show, :id => @article
        else
            render show_article_path(@article);
        end
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

    def set_current_user_article
        @article = current_user.articles.find(params[:id])
    end
end

