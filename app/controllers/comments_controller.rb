# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index,]

    def index
      @comments = Comment.where(article_id: params[:article_id])
      render json: @comments
    end


    def create
      @category = Category.find(params[:category_id])
      @article = Article.find(params[:article_id])
    
      # Assuming you're using Devise for authentication, you can access the current user like this:
      @comment = @article.comments.build(comment_params)
      @comment.user = current_user
    
      if @comment.save
        redirect_to category_article_path(@category, @article)
      else
        # Handle validation errors or other issues
        render 'new'
      end
    end

  def destroy
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:article_id])

    @comment = @article.comments.find(params[:id])
    
    @comment.destroy
    redirect_to category_article_path(@category, @article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end