class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id), notice: 'comment created successfully'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    authorize! :destroy, @comment
    if @comment.destroy
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id), notice: 'comment deleted successfully'
    else
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id), alert: 'Failed to delete the comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
