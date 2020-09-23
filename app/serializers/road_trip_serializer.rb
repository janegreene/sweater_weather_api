class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :duration, :temperature, :description
end
