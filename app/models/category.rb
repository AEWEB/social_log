class Category < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  attr_accessible :name, :category_id, :user_id
  
  validates :name,
    :length => {:in => (1..50)}
end
