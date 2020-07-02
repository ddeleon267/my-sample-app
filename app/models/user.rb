class User < ActiveRecord::Base
    has_many :posts
    validates :name, :email, uniqueness: true

    has_secure_password
end

