class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
