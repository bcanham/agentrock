require 'carrierwave/mongoid'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
 
 	field :full_name
  field :first_name
  field :last_name
  field :name
  field :login
  field :fb_uid	
  field :fb_opt_out, :type => Boolean
  field :newsletter, :type => Boolean
  mount_uploader :image, ImageUploader
  mount_uploader :default_image, DefaultImageUploader
  embeds_one :profile
  accepts_nested_attributes_for :profiles
   
  attr_accessible :full_name, :name, :email, :password, :password_confirmation, :remember_me 

  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :confirmable, :rememberable, :omniauthable
  
  before_validation :create_login, :on => :create
  before_create :skip_password_confirmation, :titleize_full_name, :parameterize_name
  after_save :generate_identicon, :on => :create
  
  validates :login, :presence => true, :uniqueness => true
  #validates :full_name, :presence => true, :format => { :with => /^[A-Za-z.' -]+$/ }
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i }  
  validates :password, :presence => true, :length => { :within => 6..20, :message => "is too short" }
  #validates :name, :presence => true, :uniqueness => true, :format => { :with => /^[A-Za-z\d._ -]+$/ }

	def self.find_for_database_authentication(conditions)
		self.where(:login => conditions[:email]).first || self.where(:email => conditions[:email]).first
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']

    if user = User.where(:email => data["email"]).first
      user
    # elsif user = User.where(:email => signed_in_resource.email).first
    #   user
    else  
 #     user = User.where(:email => signed_in_resource.email).first
      # Create an user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
#      user.update_attributes(:fb_uid => data["id"], :name => data["name"], :first_name => data["first_name"], :last_name => data["last_name"])
    end
  end
  
  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.where(:email => data["email"]).first
      user
    else # Create a user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def self.find_for_soundcloud_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.where(:email => data["email"]).first
      user
    else # Create a user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def send_confirmation_instructions(deliver=false)
    generate_confirmation_token! if self.confirmation_token.nil?
    if deliver == true
      UserMailer.confirmation_instructions(self).deliver
    end
  end

private

  def create_login
    email = self.email.split(/@/)
  	login_taken = User.where(:login => email[0]).first
  	unless login_taken
  		self.login = email[0]
  	else	
  		self.login = self.email
  	end	       
  end
  
  def parameterize_name
    self.name = self.name.split(/ /).join("-")
  end
  
  def skip_password_confirmation
    self.password_confirmation = self.password
  end
  
  def titleize_full_name
    self.full_name = self.full_name.titleize
    self.first_name = self.full_name.split(/ /)[0]
    self.last_name = self.full_name.split(/ /).drop(1).join(" ")
  end
  
  def generate_identicon
    DefaultImageUploader.new.process!
    #identicon.process!
  end

end
