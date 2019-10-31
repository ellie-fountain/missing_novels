class Review < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :favorites, dependent: :destroy
    has_many :favorited_users, through: :favorites, source: :user
    acts_as_taggable
    validates :review_title, presence: true
    validates :novel_name, presence: true
    validates :review_text, presence: true
end
