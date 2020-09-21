class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :timezone, :time, :current, :daily, :hourly
end
