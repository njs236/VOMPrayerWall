class RequestsController < ApplicationController
  before_action :ensure_login, only: [:index, :new, :create]
  def index
    #@time = Time.diff(request.created_at, Time.now())
    #condition statement about 
    #@diff = time[:day]
    @requests = Request.all
  end
  
  def new 
    @request = Request.new
  end
  
  def create
    @request = @current_user.requests.build request_params
    if @request.save
      flash[:notice] = 'Prayer request submission succeeded'
      redirect_to requests_path
    else
      render action:'new'
    end
  end
  
  private
  def request_params
    params.require(:request).permit(:title, :description)
  end
end
