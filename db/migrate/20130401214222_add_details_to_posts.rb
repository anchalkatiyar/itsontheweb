class AddDetailsToPosts < ActiveRecord::Migration
  
  #This migration file is generated by this command
  #D:\rails_demo_app\ROR_TEST\Blog_test\blog>rails g migration AddDetailsToPosts name:string state:string latitude:float longitude:string gmaps:boolean population:integer
  
  
  
  
  def change
    add_column :posts, :name, :string
    add_column :posts, :state, :string
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :string
    add_column :posts, :gmaps, :boolean
    add_column :posts, :population, :integer
  end
end
