class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :user_check, only: [:edit,:update,:destroy]

  def index
    @pictures = picture.all.order(created_at: "DESC")
  end

  def show
    @picture = picture.find(params[:id])
  end

  def new
    if params[:back]
      @picture = current_user.pictures.build(picture_params)
    else
      @picture = picture.new
    end
  end

  def edit
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path, notice: "タイムラインを投稿しました！"
    else
      render action: :new
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "タイムラインを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"タイムラインを削除しました！"
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private

  def set_picture
    @picture = current_user.pictures.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:title, :content, :image,:image_cache)
  end

    #pictureを投稿したユーザとログインユーザが同一でない場合はトップページに戻るTrueを返す
  def user_check
    unless @picture.user.id == current_user.id
      flash[:notice] = '編集・削除できません'
      redirect_to pictures_path
    end
  end


end
