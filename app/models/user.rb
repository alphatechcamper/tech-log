class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :output_reports
  validates :nickname, presence: true, length: { maximum: 6 }
  has_many :likes
end
