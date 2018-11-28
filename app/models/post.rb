class Post < ApplicationRecord
	validates :title, :author, :body, presence: true
end
