class BackReport < ApplicationRecord
  belongs_to :user
  validates :study_hours, presence: true
  validates :successes, presence: true
  validates :improvements, presence: true
  validates :learning_tips, presence: true
end
