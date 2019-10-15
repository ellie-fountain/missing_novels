class Review < ApplicationRecord
	belongs_to :user
	has_many :favorites
    has_many :favorited_users, through: :favorites, source: :user
    acts_as_taggable
end
