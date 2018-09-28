class Post < ApplicationRecord
	# Validate the title and description of a post is present
	validates :title, :description, presence: {message: 'cannot be left blank'}

	# Validates the title field is less than 30 characters
	validates :title, length: {maximum: 30, too_long: 'cannot be more than %{count} characters long'}

	# Validates the description field is less than 300 characters
	validates :description, length: {maximum: 300, too_long: 'cannot be more than %{count} characters long'}

	# Active record macro to associate uploads with posts
	has_one_attached :photo
end
