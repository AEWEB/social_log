#coding: utf-8
require 'time'
class TwitterController < ApplicationController
  layout false
  def show
    if current_user
      if params[:maxId]
        @list=current_user.client.home_timeline(:count=>20,:max_id=>params[:maxId])
      else
        @list=current_user.client.home_timeline(:count=>20)
      end
      render :action => "show"
    else
      render :text => "error"
    end
  end
  def add
    if current_user
      state = State.new(params[:state])
      state.date=Time.parse(state.date.to_s).strftime("%Y-%m-%d %H:%M")
      state.career=t("career.twitter")
      findState=State.find(:first,:conditions=>["status = ? and career=?",state.status, state.career])
      if findState
        state=findState
      else
         state.save
      end
      sodatabase=Sodatabase.new
      sodatabase.category_id=params[:category_id]
      sodatabase.user_id=current_user.id
      sodatabase.state_id=state.id
      if sodatabase.category_id==-1
        sodatabase.category_id=nil
        sodatabase.save
        render :text => "categories"
      else
        if Category.find(sodatabase.category_id,:conditions=>["user_id = ?",current_user.id])
          sodatabase.save
          render :text => "categories/init/"+sodatabase.category_id.to_s
        end
      end 
     else
      render :text => "error"
    end
  end
end


