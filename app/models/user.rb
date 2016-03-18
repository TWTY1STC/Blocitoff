class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    before_save {
        array = []
        self.name.to_s.split.each do |name|  #turn self.name into a string in order to split it, split results in an array
           array << name.capitalize
           self.name = array.join(" ") 
        end
      
    }
    
    validates :name, length: {minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: {minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: {minimum: 6 }, allow_blank: true
    
    validates :email,
                presence: true, 
                uniqueness: { case_sensative: false },
                length: { minimum: 3, maximum: 254}
                
    has_secure_password
    
end
