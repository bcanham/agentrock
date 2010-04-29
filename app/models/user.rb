class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :login, :email, :password, :password_confirmation
  
	before_create :create_login
  
  validates :login, :uniqueness => { :on => :update }
  validates :username, :presence => { :on => :create }, :uniqueness => true
  
  
  def create_login
require 'strscan'              
    email = StringScanner.new(self.email)
   	email.scan_until(/@/)
		login_taken = ::User.find_by_login(email.pre_match)
		unless login_taken
			self.login = email.pre_match
		else	
			self.login = self.email
		end	       
  end

	def self.find_for_authentication(conditions={})
		self.find_by_login(conditions[:login]) || self.find_by_email(conditions[:login])
  end
end
