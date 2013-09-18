class TopController < ApplicationController
  def index
    if current_user
      #@list=@current_user.client.home_timeline
      #raise @list.to_yaml
      render :action => "login"
    end
  end
end
