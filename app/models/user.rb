require 'stalker'
class User  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Document::ProtectedAttributes

	attr_protected :password_hash, :password_salt, :active, :activation_token, :activated_at
  
  # new columns need to be added here to be writable through mass assignment
  # attr_accessible :username, :email, :password, :password_confirmation
  
  attr_accessor :password, :password_confirmation
  
  field :username,        					:type => String
  field :email,           					:type => String
  field :login,											:type => String	
  field :password_hash,   					:type => String
  field :password_salt,   					:type => String
	field :remember_token_expires_at, :type => Time
  field :remember_token,            :type => String  
  
	field :active,                    :type => Boolean, :default => false
  field :activation_code,           :type => String
  field :activated_at,              :type => Time 
  
  field :reset_token,               :type => String 
  
  before_create :make_activation_code, :create_login
  before_save :prepare_password
  
  after_create :send_activation_mail
  
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_uniqueness_of :email
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validate :check_password
  
  def activate!
    self.active = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    active?
  end
  


  def make_reset_token
    self.reset_token = self.class.make_token
  end  

  def make_activation_code
    self.activation_code = self.class.make_token
  end

  def send_activation_mail
    UserMailer.activation(self).deliver
  end  
  
  def check_password
    if self.new_record?
      errors.add(:base, "Password can't be blank") if self.password.blank?
      errors.add(:base, "Password and confirmation does not match") unless self.password == self.password_confirmation
      errors.add(:base, "Password must be at least 4 chars long") if self.password.to_s.size.to_i < 4
    else
      if self.password.blank?
        errors.add(:base, "Password can't be blank") if self.password.blank?
      else
        errors.add(:base, "Password and confirmation does not match") unless self.password == self.password_confirmation
        errors.add(:base, "Password must be at least 4 chars long") if self.password.to_s.size.to_i < 4
      end
    end
  end
  
  # login can be either username or email address
  def self.authenticate(login, pass)
    user = first(:conditions => {:username => login}) || first(:conditions => {:email => login})
    return user if user && user.matching_password?(pass)
  end
  
  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end
  
  def remember_token?
    (!remember_token.blank?) &&
      remember_token_expires_at && (Time.now.utc < remember_token_expires_at.utc)
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token = self.class.make_token
    save(false)
  end

  # refresh token (keeping same expires_at) if it exists
  def refresh_token
    if remember_token?
      self.remember_token = self.class.make_token
      save(false)
    end
  end

  #
  # Deletes the server-side record of the authentication token. The
  # client-side (browser cookie) and server-side (this remember_token) must
  # always be deleted together.
  #
  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token = nil
    save(false)
  end 

  

  def self.secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end

  def self.make_token
    secure_digest(Time.now, (1..10).map{ rand.to_s })
  end  
  
  def prepare_password
    unless password.blank?
      self.password_salt = Digest::SHA1.hexdigest([Time.now, rand].join)
      self.password_hash = encrypt_password(password)
    end
  end
  
  def encrypt_password(pass)
    Digest::SHA1.hexdigest([pass, password_salt].join)
  end
  
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
  
  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end 
   
end









#   field :confirmation_token
#   field :confirmed_at
#   field :confirmation_sent_at
#   field :reset_password_token
#   field :remember_token
#   field :remember_created_at
#   field :sign_in_count       
#   field :current_sign_in_at
#   field :last_sign_in_at
#   field :current_sign_in_ip
#   field :last_sign_in_ip
#   field :failed_attempts
#   field :unlock_token
#   field :locked_at
#   
#   validates :email, :presence => true, :uniqueness => true
#   validates :login, :uniqueness => { :on => :update }
#   validates :username, :uniqueness => { :on => :update }