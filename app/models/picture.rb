class Picture < ApplicationRecord

  #アソシエーション
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length: { in: 1..20 }
  validates :content, presence: true, length: { in: 1..200 }
  mount_uploader :image, ImageUploader
end
