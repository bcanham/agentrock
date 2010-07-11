class Activity
  include Mongoid::Document

  
  field :source, :type => Hash
  field :action
  field :count, :type => Integer, :default => 1
end
