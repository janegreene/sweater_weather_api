class ClimbingRouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :forecast
end
