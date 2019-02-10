class Article < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5}
	validates :text, length: {maximum: 500}
	#validate if user id (assigned hash) exists in DB, if yes, proceed
end
