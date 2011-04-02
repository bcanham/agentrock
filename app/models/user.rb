class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
 
 	field :name
  field :first_name
  field :last_name
  field :login
  field :fb_uid	
  field :fb_opt_out
    

  devise :database_authenticatable, :registerable,
         :recoverable, :trackable#, :confirmable, :validatable, :lockable, :rememberable
  
	before_create :create_login
  
  validates :login, :uniqueness => { :on => :update }
  # validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true  
  
  def create_login
    email = self.email.split(/@/)
		login_taken = User.where(:login => email[0]).first
		unless login_taken
			self.login = email[0]
		else	
			self.login = self.email
		end	       
  end  

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

end
