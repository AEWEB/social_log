class AddUsers < ActiveRecord::Migration
  def up
      add_column :users, :token, :string
      add_column :users, :secret, :string
  end

  def down
     remove_column :users, :token, :string
     remove_column :users, :secret, :string
  end
end
