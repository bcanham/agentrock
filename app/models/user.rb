class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
 
  field :name,        					:type => String
  field :email,           					:type => String, :null => false
  field :login,											:type => String	
  field :encrypted_password,   					:type => String, :null => false
  field :password_salt,   					:type => String, :null => false
  field :confirmation_token
  field :confirmed_at
  field :confirmation_sent_at
  field :reset_password_token
  field :remember_token
  field :remember_created_at
  field :sign_in_count, :type => Integer       , :default => 0
  field :current_sign_in_at
  field :last_sign_in_at
  field :current_sign_in_ip
  field :last_sign_in_ip
  field :failed_attempts, :type => Integer, :default => 0
  field :unlock_token
  field :locked_at  

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #attr_accessible :username, :login, :email, :password, :password_confirmation
  
	before_create :create_login
  
  validates :login, :uniqueness => { :on => :update }
  validates :name, :presence => { :on => :update }, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true  
  
  def create_login
require 'strscan'              
    email = StringScanner.new(self.email)
   	email.scan_until(/@/)
		login_taken = ::User.first(:conditions => { :login => email.pre_match })
		unless login_taken
			self.login = email.pre_match
		else	
			self.login = self.email
		end	       
  end

	def self.find_for_database_authentication(conditions)
		self.first(:conditions => { :login => conditions[:email] }) || self.first(:conditions => { :email => conditions[:email] })
  end

end
