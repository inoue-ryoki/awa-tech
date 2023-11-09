class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :text, presence: true
  has_many :favorites, dependent: :destroy

  def self.search(search)
    if search != ''
      Post.joins(:user).merge(Post.where('text LIKE(?)', "%#{search}%"))
          .or(Post.joins(:user).merge(User.where('school_name LIKE(?)', "%#{search}%")))
          .or(Post.joins(:user).merge(User.where('address LIKE(?)', "%#{search}%")))
    end
  end

  def favorited?(user)
    if user.nil?
      false
    else
      favorites.where(user_id: user.id).exists?
    end
  end
end
