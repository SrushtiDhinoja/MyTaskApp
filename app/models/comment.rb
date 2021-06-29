class Comment < ApplicationRecord 
  default_scope { order(created_at: :desc) }
  belongs_to :blog
  has_many :likes, as: :likeable,  dependent: :destroy

  validates :body, presence: true
end
