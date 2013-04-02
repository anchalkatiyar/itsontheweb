class AddDataToPosts < ActiveRecord::Migration
  def change
    #By this way we can add data to our table through migration add below line and run "rake db:migrate" on command prompt (without quotes)
    Post.create(:title => "First Post",:content=>"First Post Created")    
  end
end
