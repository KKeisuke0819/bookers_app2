class Book < ApplicationRecord
	belongs_to :user
	validates :body, presence: true, length:{ maximum: 199}
	validates :title, presence: true, length: { maximum: 199}
    # attachment :profile_image
end
