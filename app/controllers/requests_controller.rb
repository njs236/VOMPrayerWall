class RequestsController < ApplicationController
  before_action :ensure_login, only: [:index, :new, :create]
  skip_before_action :verify_authenticity_token
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
    request = Request.find(params[:request_id].to_i)
    answer = Answer.new
    request.answer = true
    request.save
    answer.request = request
    answer.user = @current_user
    answer.save
    if current_user
     #check the prayer day for values
     if (current_user.prayer_days.where("user_id=?", @current_user.id).nil?)
        day = @current_user.prayerdays.new
        day.user = @current_user
        day.save
        if (current_user.streaks.nil?)
          streak = current_user.streaks.new
          streak.user = @current_user
          streak.save
        end
      end
    end
    redirect_to requests_path
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
