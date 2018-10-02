
class CalendarsController < ApplicationController
  before_action :ensure_login, only: [:index,:show]
  def index
    Date::DATE_FORMATS[:month] = '%B'
    date = Date.today()
    @month = date.to_formatted_s(:month)
    @requests = @current_user.requests.all
  end
  
  def show
    
  end
end
