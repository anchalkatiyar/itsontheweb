class PostsController < ApplicationController
	def index
		
=begin
D:\rails_demo_app\ROR_TEST\Blog_test\blog>rails g gmaps4rails:install
        SECURITY WARNING: No secret option provided to Rack::Session::Cookie.
        This poses a security threat. It is strongly recommended that you
        provide a secret to prevent exploits that may be possible from crafted
        cookies. This will not be supported in future versions of Rack, and
        future versions will even invalidate your existing user cookies.

        Called from: C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9.1/gems/action
pack-3.2.8/lib/action_dispatch/middleware/session/abstract_store.rb:28:in `initi
alize'.

      create  app/assets/javascripts/gmaps4rails/gmaps4rails.base.js.coffee
      create  app/assets/javascripts/gmaps4rails/gmaps4rails.googlemaps.js.coffe
e
      create  app/assets/javascripts/gmaps4rails/gmaps4rails.openlayers.js.coffe
e
      create  app/assets/javascripts/gmaps4rails/gmaps4rails.bing.js.coffee
      create  app/assets/javascripts/gmaps4rails/gmaps4rails.mapquest.js.coffee
      create  app/assets/stylesheets/gmaps4rails.css
**************************************
Google Maps For Rails

=end
		
		
		
		
		@posts = Post.find(:all) #all posts
		#@posts = Post.all
		#@json = @posts.to_gmaps4rails
		@json = Post.all.to_gmaps4rails
		@first_post = Post.find(:first)
		@second_post = Post.find(18)
		#@second_post = Post.find_by_id(2)
		#@title_post = Post.find_by_title("First Post")
		#@second_post = Post.find(2)
		@third_post = Post.find(:all,:conditions=>["id=?",3] )
		#@second_post.title = "Our Second Post"
		#@second_post.save
		#@second_post.update_attribute(:content,"Our Second Post Content")
		#@second_post.update_attributes(:title=>"2nd post",:content=>"this is Second Post Content")
		
		
		#the below query is to select the columns id,title,price,subject_id from Books table,it will only select the columns that is 
       #specified in the query with :select=>  option...........
     @selected_column  = Post.find(:all, :select => 'id,title,created_at,updated_at', :conditions => ["id >= ?",5])
	end	
	
	def show
		@post = Post.find(params[:id])
	end
	
	def new
		@post = Post.new
	end
	
	def create
		@post = Post.new(params[:post])
		
		if @post.save 
			redirect_to posts_path , :notice => "Post was saved successfully"
		else
			render "new"
		end		
	end
	
	def edit
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		
		if @post.update_attributes(params[:post])
			# redirect_to :action => 'index', :notice => "Post was updated successfully this is to check"
			redirect_to posts_path , :notice => "Post was updated successfully"
		else	
			render "edit"
		end	
	end
	
	def destroy	
		#Post.find(params[:id]).destroy
		@post = Post.find(params[:id])
		@post.destroy	
		redirect_to posts_path ,:notice => "Your #{@post.title} post has been deleted "
	end
	
	def test_queries
		@posts = Post.all
	end
end
