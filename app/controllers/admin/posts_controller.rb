#class PostsController < ApplicationController
class Admin::PostsController < ApplicationController
	def index
		#@posts = Post.find(:all) #all posts
		@posts = Post.all
		@first_post = Post.find(:first)
		@second_post = Post.find(2)
		#@second_post = Post.find_by_id(2)
		#@title_post = Post.find_by_title("First Post")
		#@second_post = Post.find(2)
		@third_post = Post.find(:all,:conditions=>["id=?",3] )
		@second_post.title = "Our Second Post"
		@second_post.save
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
	
	def say_hello
		@third_post = Post.find(:all,:conditions=>["id=?",3] )
		@rd = session[:third] = @third_post
		
		@rd.each do |t|	
			po = t.title
			@like_query = Post.find(:all,:conditions => "title like '%"+po+"%'")
		end
		
		 #prop_name = params[:q]
		#@property = Property.find(:all , :conditions=>"name like '%"+prop_name+"%'")
		
	end	
end
