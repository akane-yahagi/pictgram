class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, success: "登録が完了しました"
      #flash[:success] = "登録が完了しました" でも可能
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
      #flash.nowは現在のアクションで表示するページにflashを表示したいとき(render)
      #flashは次のアクションで遷移したページにflashを表示したいとき(redirect_to)
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    #strong parametersと言うらしい。
    #params.require(:user)は:userがkeyとして存在すれば、params[:user]となる。
  end
  
  
end
