module Convertable
  def convert_hourly_time(unix_time)
    Time.at(unix_time).strftime('%l:%M %p')
  end

  def convert_day_and_time(unix_time)
    Time.at(unix_time).strftime('%l:%M %p, %B %e')
  end

  def convert_day(unix_time)
    Time.at(unix_time).strftime('%A')
  end
end
