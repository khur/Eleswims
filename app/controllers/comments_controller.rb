class CommentsController < ApplicationController
   before_action :require_login
  def index
  end

  def create
    @blog = Blog.find(params[:id])
    # @comment = Comment.new(comment_params)
    # @comment.blog = @blog
    @comment = @blog.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to blog_path(@blog)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
    @comment.destroy
    redirect_to blog_path(@blog)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
