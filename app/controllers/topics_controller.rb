class TopicsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @topics = Topic.all
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    #これなんでTopicじゃなくてtopics？
    
    if @topic.save
      redirect_to topics_url, success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def topic_params
    params.require(:topic).permit(:description, :image)
  end
      
end
