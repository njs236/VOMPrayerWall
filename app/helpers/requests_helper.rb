module RequestsHelper
  
  def lengthoftimeago(datetime)
    #case : if same hour, print minutes
    # if same day, print hours
    #else print days
    Date::DATE_FORMATS[:day_month_year] = "%Y-%m-%d"
    date = Time.current
    date = date.in_time_zone("Pacific/Auckland")
    startdate = datetime.in_time_zone("Pacific/Auckland")
    time_interval = Time.diff(startdate, date)
    if (time_interval[:day] == 0 && time_interval[:hour] == 0) 
      mins = time_interval[:minute]
      minute =  "#{mins} minutes ago"
      return minute
    elsif (time_interval[:day] == 0 && time_interval[:hour] >= 0)
      hours = time_interval[:hour]
      hour =  "#{hours} hours ago"
      return hour
    elsif (time_interval[:day] >= 0)
      days = time_interval[:day]
      day = "#{days} days ago"
      return day
    end
    return time_interval[:diff]
  end
  
end
