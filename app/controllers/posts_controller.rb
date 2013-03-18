class PostsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @post = Post.new
    @tribes = current_user.tribes.order_by('name ASC').collect {|x| [x.name, x.id] }
  end

  def index
    if current_user.memberships.empty?
      redirect_to tribes_path
    else   
    @posts = current_user.posts.all
    end
  end
  
  def slides
    @posts = Post.all
  end
  
  def show
    if Post.find(params[:id]).user_id == current_user.id
      @post = Post.find(params[:id])
      elsif current_user.admin?
      else
        redirect_to root_path
      end   
  end
  
  def edit
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
    @tribes = current_user.tribes.order_by('name ASC').collect {|x| [x.name, x.id] }  
    elsif current_user.admin?
    else redirect_to root_path
    end  
  end
  
  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Posted!"
      redirect_to @post
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