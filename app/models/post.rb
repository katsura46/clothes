class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  # コメント機能
  has_many :comments, dependent: :destroy

  # いいね機能
  has_many :favorites, dependent: :destroy

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  
  

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_one_attached :post_image
  def get_post_image(width, height)
    post_image.variant(resize_to_limit: [width, height]).processed
  end
end
