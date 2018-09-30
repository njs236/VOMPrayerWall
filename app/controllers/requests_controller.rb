class RequestsController < ApplicationController
  before_action :ensure_login, only: [:index, :new, :create]
  def index
    #time = Time.diff(request.created_at, Time.now())
    #@diff = time[:day]
    @requests = Request.all
  end
  
  def new 
    @request = Request.new
  end
  
  def create
    @story = @current_user.stories.build story_params
  end
  
  private
  def request_params
    params.require(:request).permit(:title, :description)
  end
end
