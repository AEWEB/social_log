class TopController < ApplicationController
  def index
    if current_user
      redirect_to :controller =>"categories"
    end
  end
end
