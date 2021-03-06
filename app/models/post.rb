class Post < ApplicationRecord
  # 新着順へ並び方を変更する機能
  default_scope -> { order(created_at: :desc) }

  belongs_to :user

  # コメント機能
  has_many :comments, dependent: :destroy

  # いいね機能
  has_many :favorites, dependent: :destroy

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy

  has_many :genres, dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_one_attached :post_image
  def get_post_image(width, height)
    post_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :title, presence: true, length:{maximum:15}
  validates :post_image, presence: true
  validates :comment, presence: true, length:{maximum:200}
  validates :brand, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
end
