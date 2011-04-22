class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
  

  
  embeds_many :users
  embeds_many :sites
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :sites
  
end
