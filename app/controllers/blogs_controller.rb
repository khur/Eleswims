class BlogsController < ApplicationController
  before_action :require_login, except: [:show, :index ]
  before_action :edit_authorized?, only: [:edit, :update, :new]

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
      params.require(:blog).permit(:title, :body, :image )
    end

    def edit_authorized? 
      unless current_user.administrator == true ||current_user == Blog.find(params[:id]).user 
        flash[:error] = "Not your blog!"
        redirect_to blog_path
      end
    end
end
