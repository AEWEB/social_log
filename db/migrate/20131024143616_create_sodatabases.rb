class CreateSodatabases < ActiveRecord::Migration
  def change
    create_table :sodatabases do |t|
      t.references :category
      t.foreign_key :categories, dependent: :delete
      t.references :user, null: false
      t.foreign_key :users, dependent: :delete
      t.references :state, null: false
      t.foreign_key :states, dependent: :delete
    end
  end
end