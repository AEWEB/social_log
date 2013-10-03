class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name,:null=>false
      t.references :category
      t.foreign_key :categories, dependent: :delete
      t.references :user, null: false
      t.foreign_key :users, dependent: :delete
    end
  end
end
