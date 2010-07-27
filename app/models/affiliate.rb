class Affiliate
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Tracking
  
  field :name,        					:type => String, :accessible => true
  field :email,           					:type => String, :null => false, :accessible => true
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
  # :token_authenticatable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

end
