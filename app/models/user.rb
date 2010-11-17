class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
 
  field :name, :null => false
  field :login, :null => false
    

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable, :lockable
  
	before_create :create_login, :create_geocode
  
  validates :login, :uniqueness => { :on => :update }
  validates :name, :presence => true, :uniqueness => true
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

end
