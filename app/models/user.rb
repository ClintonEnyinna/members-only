class User < ApplicationRecord
    attr_accessor :token
    before_create :create_remember_token
    has_secure_password

    has_many :posts

    def self.new_token
      SecureRandom.urlsafe_base64
    end

    def update_remember_token
      self.token = User.new_token
      update_attribute(:remember_token, Digest::SHA1.hexdigest(token))
    end

    def forget
      update_attribute(:remember_token, nil)
    end

    def authenticated?(token)
      user_token = self.remember_token
      return false if self.remember_token.nil?
      user_token == Digest::SHA1.hexdigest(token)
    end

    private
    
    def create_remember_token
      self.token = User.new_token
      self.remember_token = Digest::SHA1.hexdigest(token)
    end

end
