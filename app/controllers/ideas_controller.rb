class IdeasController < ApplicationController
  PER_PAGE =10
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_idea, only: [:show,:edit, :update, :destroy, :lock]
  before_action :authorize!, only: [:edit, :update,:destroy]
  def new
  end
  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save

      redirect_to ideas_path(@idea), notice: "idea Created"
    else
      flash[:alert] = "See errors below"
      render :new
    end
  end
  def index
    @idea  = Idea.new
    @ideas = Idea.page(params[:page]).per(PER_PAGE)
  end
  def show
    @comment = Comment.new
  end
  def edit
  end

  def update

  end

  def destroy

  end

  private

  def authorize!
    redirect_to root_path, alert: "access denied" unless can? :manage, @idea
  end

  def idea_params
    params.require(:idea).permit(:title, :description)
  end


  def find_idea
      @idea = Idea.find(params[:id])
  end
end
