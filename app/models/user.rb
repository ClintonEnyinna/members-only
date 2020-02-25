class User < ApplicationRecord
    before_create :create_remember_token
    has_secure_password

    def self.new_token
      SecureRandom.urlsafe_base64
    end
    
    private

    def create_remember_token
      remember_digest = Digest::SHA1.hexdigest(User.new_token.to_s)
    end

end
