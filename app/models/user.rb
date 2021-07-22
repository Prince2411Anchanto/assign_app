class User < ApplicationRecord
    validates :username, uniqueness: { case_sensitive: false },
                presence: true, 
                length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_FORMAT = /\A[a-zA-Z0-9]+\@[A-Za-z0-9]+\.[a-z]+\z/i
    validates :email, uniqueness: { case_sensitive: false },
                presence: true, 
                length: { maximum: 100 },
                format: { with: VALID_EMAIL_FORMAT }
end