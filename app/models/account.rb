class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tracking
  
  field :city
  field :zip
  field :lat
  field :long
  field :birthday
  
  
  
end
