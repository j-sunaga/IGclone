class Favorite < ApplicationRecord
  #アソシエーション
  belongs_to :picture
  belongs_to :user

end
