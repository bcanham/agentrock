class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tracking
  
  field :owner
  field :city
  field :zip
  field :lat
  field :long
  field :birthday
  
  attr_accessor :location
  
  before_save :set_location
  
  def set_location   
    if /\A(\d{5})(-\d{4})?\Z/.match(self.location)
    	self.zip = self.location
    elsif /\A[\s,a-zA-Z]+\Z/.match(self.location)
    	self.city = self.location
    end 
  end
  
end
