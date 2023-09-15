class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  has_many :likes

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
