class User < ActiveRecord::Base
  attr_accessible :image, :name, :provider, :uid, :token, :secret
  
  def self.create_with_omniauth(auth)
    create!do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      if user.provider == "facebook"
         user.name = auth["info"]["name"]
      else
         user.name = auth["info"]["nickname"]
         user.image = auth["info"]["image"]
         user.token = auth['credentials']['token']
         user.secret= auth['credentials']['secret']
      end
    end
  end
  
  def client
    Twitter::Client.new(oauth_token: token, oauth_token_secret: secret)
  end
end
