class User < ApplicationRecord
    has_secure_password
    has_many :questions
    has_one_attached :image
    has_many :answers, dependent: :destroy
end
