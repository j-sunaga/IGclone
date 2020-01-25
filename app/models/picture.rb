class Picture < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 1..20 }
  validates :content, presence: true, length: { in: 1..200 }
  mount_uploader :image, ImageUploader
end
