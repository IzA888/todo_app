class User < ApplicationRecord
    has_secure_password

    
    has_many :tasks

    validates :username, presence: true, length: {minimun: 4}, uniqueness: {case_sensitive: true}

    def authenticate(password)
        password == password
    end

end
