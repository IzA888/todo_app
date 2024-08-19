class User < ApplicationRecord
    
    has_many :tasks

    def authenticate(password)
        password == password
    end

end
