class CommentsController < ApplicationController

  def create

    @comment = Comment.new comment_params
    @comment.user = current_user
    @idea = Idea.find params[:idea_id]
    @comment.idea = @idea
    if @comment.save
    redirect_to idea_path(@idea), notice: "Comment created"
    else
      flash[:alert] = "Answer wasn't created"
      render "/ideas/show"
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @idea = Idea.find params[:idea_id]
    @comment.destroy
    redirect_to idea_path(@idea), notice: "comment deleted"
  end

  private


  def comment_params
    params.require(:comment).permit(:body)
  end
end
