class CommentsController < ApplicationController
  before_action :set_topic
  
  def new
    @comments = Comment.new
    render partial: "form"
  end

  def create
    @comments = @topics.comments.new(comment_params)

    if @comments.save
      redirect_to sub_topic_path(@topics.sub_id, @topics)
    else
      render :new
    end
  end

private

def set_topic
  @topics = Topic.find(params[:topic_id])
end

def comment_params
  params.require(:comment).permit(:body, :author)
end


end
