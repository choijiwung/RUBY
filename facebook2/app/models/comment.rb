class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presense: true
end