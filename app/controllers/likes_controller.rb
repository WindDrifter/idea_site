class LikesController < ApplicationController
  def create
    i = Idea.find params[:idea_id]
    like = Like.new(idea: i, user: current_user)
    if like.save
    redirect_to ideas_path, notice: "300 more likes and you get a SURPRISE"
    else
      redirect_to ideas_path, notice: "You already like this. So have a Jarate"

    end
  end
  def destroy
    #@like =
    like = Like.find params[:id]
    #redirect_to root_path, alert: "access denied" unless can? :destroy, like
    idea = Idea.find params[:idea_id]
    like.destroy
    redirect_to ideas_path, notice: "Unliked"
  end




end
