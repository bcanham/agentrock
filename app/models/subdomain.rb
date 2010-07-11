class Subdomain
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
  
  field :name
  field :created_by
  field :user_ids, :type => Array  
  
	def self.matches?(request)
	  request.subdomain.present? && request.subdomain != ["www", "blog", "admin", "support"]
	end  
  
end
