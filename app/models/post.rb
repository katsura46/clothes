class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_one_attached :post_image
  def get_post_image(width, height)
    post_image.variant(resize_to_limit: [width, height]).processed
  end
end
