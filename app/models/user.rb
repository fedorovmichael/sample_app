class User < ActiveRecord::Base
   
   before_save { self.email = email.downcase }
   VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/
   validates :name, presence: true, length: { maximum: 20 } 
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
   has_secure_password
   validates :password, length: { minimum: 6}
   
   #attr_accessible :password, :password_confirmation
    
end
