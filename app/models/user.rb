class User < ApplicationRecord
validates :username, :password_digest, :session_token, presence: true 
validates :email, allow_nil: true
validates :email, :username, uniqueness: true 
validates :password, length: { minimum: 6, allow_nil: true }

after_initialize: ensure_session_token 
attr_reader :password 

    def find_by_credentials(username, password)
        @user = User.find_by(username: username)
        if @user && is_password?(password)
            return @user 
        else 
            nil 
        end 
    end 

    def reset_session_token
        
    end 
end 