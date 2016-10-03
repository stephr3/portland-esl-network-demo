class Link < ActiveRecord::Base
  validates :title, :url, :description, presence: true
  validates :title, length: { maximum: 200 }
  validates :url, length: { maximum: 70 }
  validates :description, length: { maximum: 1000 }
end
