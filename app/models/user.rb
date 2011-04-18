class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking

  embedded_in :account, :inverse_of => :users
  # embeds_one :profile
  # accepts_nested_attributes_for :profile
 
 	field :name
  field :first_name
  field :last_name
  field :login
  field :fb_uid	
  field :fb_opt_out
   
  attr_accessible :name, :login, :email, :password, :password_confirmation, :remember_me 
  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :confirmable, :rememberable
  
  before_create :create_login
  
  validates :login, :uniqueness => { :on => :update }
  validates :name, :presence => true, :uniqueness => true, :format => { :with => /^[A-Za-z\d._-]+$/ }
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i }  
  validates :password, :password_confirmation, :presence => true, :length => { :within => 6..20, :message => "is too short" }
  validates_confirmation_of :password, :message => "doesn't match"

  def self.find(*args)
    options = args.extract_options!
    user_options = Hash[*(options[:conditions] || {}).map { |k, v| [ :"users.#{k == :id ? :_id : k}", v ] }.flatten]
    if account = Account.find(*(args + [options.merge(:conditions => user_options)]))
      account.users.detect do |u|
        options[:conditions].all? { |k, v| u.send(k) == v }
      end
    else
      super
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
  
  def check_name
    
  end

end
