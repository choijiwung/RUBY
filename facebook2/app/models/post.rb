class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # 주인없는 친구들을 날려주는
  validates :title, presense: true
  validates :content, presense: true
  
end
