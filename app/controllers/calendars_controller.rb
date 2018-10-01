
class CalendarsController < ApplicationController
  def show
    Date::DATE_FORMATS[:month] = '%B'
    date = Date.today()
    @month = date.to_formatted_s(:month)
    @requests = @current_user.requests.all
  end
end
