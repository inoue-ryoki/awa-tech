class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :text, presence: true

    def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")




    else
      Post.all
    end
  end
end
