class Question < ApplicationRecord
    belongs_to :user
    scope :recent, -> { order(created_at: :desc)}
    has_many :answers, dependent: :destroy
end
