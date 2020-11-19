class SessionsController < ApplicationController
  def new
  end
  
  #sessionはブラウザを閉じれば自動的に終了する
  def create
    user = User.find_by(email_params)
    
    if user && user.authenticate(password_params[:password])
      #user.authenticate(引数)の引数はpassword文字列でないといけないため[:password]が必要
      
      log_in(user)
      #メソッドの呼び出し
      redirect_to root_url, success: "ログインに成功しました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: "ログアウトしました"
  end
  
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def email_params
    params.require(:session).permit(:email)
  end
  
  def password_params
    params.require(:session).permit(:password)
  end
    
end
