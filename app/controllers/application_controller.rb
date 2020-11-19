class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #Railsのセキュリティ対策
    
    add_flash_types :success, :info, :warning, :danger
    #これがないとBootstrapに対応した4つのkeyが使えない
    #:notice, :alertはデフォルトでkeyに入ってるので記入不要
    
    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        #@current_user = @current_user || User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !current_user.nil?
        #!は否定。
        #ログインするとcurrent_userにuserオブジェクトが入る
        #!current_user.nil? => true
        #current_userがいる状態でlogged_in? => trueとなる
    end
end
