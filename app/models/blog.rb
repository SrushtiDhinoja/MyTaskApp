class Blog < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :user
  has_many :comments,-> {includes :likes}, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :blog_title, presence: true
  validates :description, presence: true

end
