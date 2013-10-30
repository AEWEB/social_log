require 'date'
class State < ActiveRecord::Base
  attr_accessible :status, :career, :user_id, :user_name, :screen_name, :text, :image, :date
end
