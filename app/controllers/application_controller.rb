class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #Railsのセキュリティ対策
    
    add_flash_types :success, :info, :warning, :danger
    #これがないとBootstrapに対応した4つのkeyが使えない
    #:notice, :alertはデフォルトでkeyに入ってるので記入不要
end
