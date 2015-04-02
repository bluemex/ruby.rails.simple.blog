class CommentsController < ApplicationController

    before_action :set_comments, :only => [ :list, :update]

    def list

    end

    def create
        @article = Article.find(params[:article_id])
        @article.comments.create(comment_params)

        redirect_to article_path(@article)
    end


    def update

    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to article_path(@article)
    end

  private

    def comment_params
      params.require(:comment).permit(:name, :comment, :article_id)
    end

    def set_comments
        @comments = Comment.where("article_id = ?", params[:article_id])
    end
end
