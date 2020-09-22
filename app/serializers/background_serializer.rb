class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :url, :source, :location
end
