class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @comment.user = current_user
    @comment.save
#    @comment = @post.comments.build params[:comment].merge(user_id: current_user.id)
    

    respond_to do |format|
        format.js
        format.html { redirect_to :back }         
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id]).destroy
    flash[:success] = "Comment destroyed"
    redirect_to :back
  end
    
end  