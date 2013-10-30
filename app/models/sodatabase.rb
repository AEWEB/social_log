class Sodatabase < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :state
  attr_accessible :category_id, :user_id, :state_id
end
