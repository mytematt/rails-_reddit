class TopicsController < ApplicationController
  before_action :set_subs
  before_action :set_topics, only: [:show, :edit, :update, :destroy]
  
  def index
    @topics = @subs.topics
  end

  def show
  end

  def new
    @topics = @subs.topics.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @topics = @subs.topic.new(topic_params)
    if @topics.save
      redirect_to [@subs, @topics]
    else
      render :new
    end
  end

  def update
    if @topics.update(topic_params)
      redirect_to [@subs, @topics]
    else
      render :edit
    end
  end

  def destroy
    @topics.destroy
    redirect_to sub_topics_path
  end


private

def set_subs
  @subs = Sub.find(params[:sub_id])
end

def set_topics
  @topics = Topic.find(params[:id])
end

def topic_params
  params.require(:topic).permit(:body, :name)
end

end
