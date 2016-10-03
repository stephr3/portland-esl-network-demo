class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, length: { maximum: 200 }
  validates :content, length: { maximum: 1000 }
end
