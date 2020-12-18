class Answer < ApplicationRecord
	has_many :likes, as: :likeable
	belongs_to :user
end
