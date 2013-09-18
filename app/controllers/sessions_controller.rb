class SessionsController < ApplicationController
  def callback
    #raise request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    #Userモデルを検索
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) 

    if user
       # 既存のユーザ情報があった場合　ルートに遷移させます
       session[:user_id] = user.id
       redirect_to root_url
    else
       # Userモデルに:providerと:uidが無い場合（外部認証していない）、保存してからルートへ遷移させる
       User.create_with_omniauth(auth)
       redirect_to root_url
    end 
  end
  def destroy
    reset_session
    redirect_to root_url
  end
end
