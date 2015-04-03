class ArticlesController < InheritedResources::Base

    before_action :authenticate_user!, except: [ :index, :show]
    before_action :set_article, :only => [ :show, :edit, :update, :destroy]

    def index
        @articles = Article.includes(:user).order("updated_at desc").page(params[:page]).per(5)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id
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
end

