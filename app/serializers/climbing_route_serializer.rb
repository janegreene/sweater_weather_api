class ClimbingRouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :forecast, :routes
end
