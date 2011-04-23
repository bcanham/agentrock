class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
 
 	field :name
  field :first_name
  field :last_name
  field :path
  field :login
  field :fb_uid	
  field :fb_opt_out, :type => Boolean
  field :newsletter, :type => Boolean

  embeds_one :profile
  accepts_nested_attributes_for :profiles
   
  attr_accessible :name, :login, :email, :password, :password_confirmation, :remember_me 

  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :confirmable, :rememberable
  
  before_create :create_login, :skip_password_confirmation, :titleize_name, :parameterize_path
  
  validates :login, :uniqueness => { :on => :update }
  validates :name, :presence => true, :format => { :with => /^[A-Za-z.' -]+$/ }
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i }  
  validates :password, :presence => true, :length => { :within => 6..20, :message => "is too short" }
  validates :path, :presence => true, :uniqueness => true, :format => { :with => /^[A-Za-z\d._ -]+$/ }

	def self.find_for_database_authentication(conditions)
		self.where(:login => conditions[:email]).first || self.where(:email => conditions[:email]).first
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token

    if user = User.where(:fb_uid => (data["id"])).first
      user
    # elsif user = User.where(:email => signed_in_resource.email).first
    #   user
    else  
      user = User.where(:email => signed_in_resource.email).first
      # Create an user with a stub password.
      user.update_attributes(:fb_uid => data["id"], :name => data["name"], :first_name => data["first_name"], :last_name => data["last_name"])
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
  
  def parameterize_path
    self.path = self.path.split(/ /).join("-")
  end
  
  def skip_password_confirmation
    self.password_confirmation = self.password
  end
  
  def titleize_name
    self.name = self.name.titleize
    self.first_name = self.name.split(/ /)[0]
    self.last_name = self.name.split(/ /).drop(1).join(" ")
  end

end
