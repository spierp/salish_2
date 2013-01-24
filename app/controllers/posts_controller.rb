class PostsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @post = Post.new
  end

  def index
    if current_user.memberships.empty?
      redirect_to tribes_path
    else   
    @posts = Post.all
    end
  end
  
  def slides
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Tribe.find(params[:id])
    if current_user.id == @post.user_id
    elsif current_user.admin?
    else redirect_to root_path
    end  
  end
  
  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Posted!"
      redirect_to posts_path
    else    
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post Updated"
      redirect_to posts_path
    else  
      render 'edit'
    end  
  end


  def destroy
    @post = Post.find(params[:id]).destroy
    flash[:success] = "Post destroyed"
    redirect_to posts_path
  end

end