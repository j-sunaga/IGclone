class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites
  end

  def create
   current_user.favorites.create(picture_id: params[:picture_id])
   picture =
   redirect_to pictures_url, notice: "#{Picture.find(params[:picture_id]).user.name}さんの写真をお気に入り登録しました"
 end

 def destroy
   current_user.favorites.find_by(id: params[:id]).destroy
   redirect_to pictures_url, notice: "#{Picture.find(params[:picture_id]).user.name}さんの写真をお気に入り解除しました"
 end

end
