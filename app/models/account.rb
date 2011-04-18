class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
  
  field :name, :null => false
  field :country
  field :state
  field :city
  field :zip
  field :lat, :type => Float
  field :lng, :type => Float
  
  embeds_many :users
  accepts_nested_attributes_for :users
  
  attr_accessor :location
  
  # mount_uploader :image, ImageUploader
  
  before_save :do_geocode!

  def do_geocode!
    response = Net::HTTP.get_response(URI.parse("http://maps.googleapis.com/maps/api/geocode/json?address=#{Rack::Utils.escape(location)}&sensor=false"))
    json = ActiveSupport::JSON.decode(response.body)
    self.lat, self.lng, self.city, self.state, self.zip, self.country = json["results"][0]["geometry"]["location"]["lat"], json["results"][0]["geometry"]["location"]["lng"], json["results"][0]["address_components"][1]["long_name"], json["results"][0]["address_components"][2]["long_name"], json["results"][0]["address_components"][0]["long_name"], json["results"][0]["address_components"][3]["long_name"]
  rescue
    false # For now, fail silently...
  end
  
end
