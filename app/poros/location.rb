class Location
  attr_reader :name, :lat_lng
  def initialize(location_params)
    @lat_lng = get_lat_lng(location_params)
    @name = get_formatted_name(location_params)
  end

  private

  def get_lat_lng(location)
    info = MapService.get_location(location)
    if info[:info][:statuscode] == 400
      nil
    else
      info[:results][0][:locations][0][:latLng]
    end
  end

  def get_formatted_name(location)
    info = MapService.get_location(location)
    if info[:info][:statuscode] == 400
      nil
    else
      info[:results].first[:locations].first[:adminArea5] +
      ', ' +
      info[:results].first[:locations].first[:adminArea3] +
      ' ' +
      info[:results].first[:locations].first[:adminArea1]
    end
  end
end
