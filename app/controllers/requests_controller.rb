class RequestsController < ApplicationController
  before_action :ensure_login, only: [:index, :new, :create]
  def index
    #@time = Time.diff(request.created_at, Time.now())
    #condition statement about 
    #@diff = time[:day]
    @requests = Request.order('created_at desc')
  end
  
  def new 
    @request = Request.new
  end
  
  def createanswer
    request = Request.find(params[:request_id])
    answer = @request.answers.new
    answer.request = params[:request_id]
    answer.user = @current_user
    answer.save
    #check the prayer day for values
    if (@current_user.prayerdays.where("user_id=?", @current_user.id).nil?)
      day = @current_user.prayerdays.new
      day.user = @current_user
      day.save
      streak = @current_user.streaks.new
      streak.user = @current_user
      streak.save
    end
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
