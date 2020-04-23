class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(com_params)
    redirect_to post_path(@post)

  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      
      redirect_to post_path(@post)
      flash[:notice] = "There comment was deleted"
    else
      flash[:error] = "There was an error, the comment was not deleted"
    end

  end

private

  def com_params
    params.require(:comment).permit(:name, :message)
  end

end
