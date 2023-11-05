class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_one_attached :image
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # フォローしたか、されたかの関係
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  # 一覧画面で使う
  has_many :following_user, through: :follower, source: :followed
  # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower
  # 自分をフォローしている人

  validates :name, presence: true

  # フォローしたときの処理
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # フォローを外すときの処理
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定
  def following?(user)
    following_user.include?(user)
  end
end
