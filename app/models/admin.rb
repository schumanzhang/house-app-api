class Admin < ApplicationRecord
    # this automatically adds methods to set and authenticate against a BCrypt password
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
