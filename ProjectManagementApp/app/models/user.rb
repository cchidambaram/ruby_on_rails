class User < ActiveRecord::Base  
  belongs_to:role     
  validates_presence_of :login_name ,:first_name ,:last_name ,:role   
  validates_format_of :first_name, :last_name, :with => /\A([A-Za-z]*)[.\s]*[A-Za-z]+\z/    
  validates_uniqueness_of :login_name, :message => " already exist"
  validates_length_of :login_name, :within => 4..20, :too_long => " :cannot be more than 20 characters", :too_short => ":cannot be less than 4 characters" 
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..20}                       
  before_save :encrypt_password  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }  
  validates :phone_no,presence: true, :numericality => {:only_integer => true}
  include BCrypt
  
	def encrypt_password
		if password.present?		
			sha1_password = Digest::SHA1.hexdigest("#{12345}#{password}")
			self.password = BCrypt::Password.create(sha1_password).to_s
		end
	end 
	
	def self.authenticate(login_name, new_password)
		user = find_by_login_name(login_name)
		if user
			sha1_password = Digest::SHA1.hexdigest("#{12345}#{new_password}")
			if BCrypt::Password.new(user.password) == sha1_password		 
			  user
			else		
			  nil
			end
		else
			nil
		end
  end

end
