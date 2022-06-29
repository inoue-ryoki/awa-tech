class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :text, presence: true

    def self.search(search)
    if search != ""


    Post.joins(:user).merge(Post.where('text LIKE(?)', "%#{search}%")).or(Post.joins(:user).merge(User.where('school_name LIKE(?)', "%#{search}%")))




    else
      Post.all
    end
  end
end
