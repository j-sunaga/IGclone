class FavoritesController < ApplicationController

  def create
   favorite = current_user.favorites.create(picture_id: params[:picture_id])
   redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんの写真をお気に入り登録しました"
 end

 def destroy
   favorite = current_user.favorites.find_by(id: params[:id]).destroy
   redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんの写真をお気に入り解除しました"
 end

end
