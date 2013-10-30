class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :status,:null=>false
      t.integer :career,:null=>false
      t.string :user_id,:null=>false
      t.string :user_name,:null=>false
      t.string :screen_name,:null=>false
      t.text :text,:null=>false
      t.string :image,:null=>false
      t.datetime :date, null: false
    end
  end
end