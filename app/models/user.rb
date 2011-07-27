class User < ActiveRecord::Base
    has_many :carts
    has_many :orders
    has_many :addresses
    acts_as_authentic
    ROLES = %w[admin moderator author banned]
    
end
