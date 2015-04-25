class BlogsController < ApplicationController
  def index
      @blogs = Blog.all
    end

    def new
      @blog = Blog.new
    end

    def show
      @blog = Blog.find(params[:id])
      @comments = Comment.all
      @comment = Comment.new
    end

    def create
      @blog = Blog.new(blog_params)
      @blog.user = current_user
      if @blog.save
        redirect_to blogs_path
      else
        render :new
      end
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
      @blog = Blog.find(params[:id])
      if @blog.update_attributes(blog_params)
        redirect_to blog_path
      else
        render :edit
      end
    end

    def destroy
      @blog = Blog.find(params[:id])
      @blog.destroy
      redirect_to blogs_path
    end



    private 

    def blog_params
      params.require(:blog).permit(:title, :body )
    end
end
