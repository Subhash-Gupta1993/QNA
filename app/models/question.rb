class Question < ApplicationRecord
	has_many :answers
	has_many :likes, as: :likeable
	scope :recent, -> {order('created_at DESC')}
end
