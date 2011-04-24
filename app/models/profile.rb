class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
  
  embedded_in :user

  field :city
  field :region
  field :country
  field :zip
  field :lat, :type => Float
  field :lng, :type => Float
  mount_uploader :image, ImageUploader  
  attr_accessor :location
  
  before_save :do_geocode!

private

  def do_geocode!
    response = Net::HTTP.get_response(URI.parse("http://maps.googleapis.com/maps/api/geocode/json?address=#{Rack::Utils.escape(location)}&sensor=false"))
    json = ActiveSupport::JSON.decode(response.body)
    self.lat, self.lng, self.city, self.region, self.zip, self.country = json["results"][0]["geometry"]["location"]["lat"], json["results"][0]["geometry"]["location"]["lng"], json["results"][0]["address_components"][1]["long_name"], json["results"][0]["address_components"][2]["long_name"], json["results"][0]["address_components"][0]["long_name"], json["results"][0]["address_components"][3]["long_name"]
  rescue
    false # For now, fail silently...
  end

end