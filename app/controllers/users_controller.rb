class UsersController < ApplicationController

  # before_action :user_find, only: [:show,:edit,:update]
  # before_action :user_check, only: [:edit,:update]
  # skip_before_action :login_required

  def new
     @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      # session[:user_id]=@user.id
      # redirect_to timelines_path, notice: "会員登録が完了しました。"
    else
      render 'new'
    end
  end

  def show
    @user=User.find(1)
  end

  def edit
    @user=User.find(1)
  end

  #アップデートアクション
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "会員情報を変更しました。"
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end

  def user_find
    @user= User.find(params[:id])
  end

  # #ログインユーザが同一でない場合はトップページに戻るTrueを返す
  # def user_check
  #   unless @user.id == current_user.id
  #     flash[:notice] = '編集できません'
  #     redirect_to timelines_path
  #   end
  # end

end
