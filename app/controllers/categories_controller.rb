# encoding: utf-8
class CategoriesController < ApplicationController
  def new
    @category = Category.new
    @category.category_id=params[:category_id]
   # raise @category.category_id.to_yaml
    @parentCategory=parseCategory(@category.category_id)
   #  raise @parentCategory.to_yaml
  end
  def parseCategory(category_id)
    if category_id==-1
      parent=Category.new
      parent.id=-1
      parent.name=t("category.home")
      parent
    else
      Category.find(category_id,:conditions=>["user_id = ?",current_user.id])
    end
  end
  def parseCategoryToDB(category)
    if category.category_id==-1
      category.category_id=nil
    end
    category.user_id=current_user.id
    category
  end
  def create
    @category = Category.new(params[:category])
    @parentCategory=parseCategory(@category.category_id)
    @category=parseCategoryToDB(@category)
    #raise @category.to_yaml
    if @category.save
      if @parentCategory.id==-1
        index
      end
    else
      render :action => "new"
    end
  end
  def init
    @categories = Category.find(:all,:conditions => ["user_id = ? and category_id=?",  current_user.id,params[:category_id]])
    show(params[:category_id])
  end
  def index
    if current_user
      @categories = Category.find(:all,:conditions => ["user_id = ? and category_id is ?",  current_user.id, nil])
      show(-1)
    end
  end
  def show(category_id)
     @category=parseCategory(category_id)
     render :action => "categories"
  end
  
end
