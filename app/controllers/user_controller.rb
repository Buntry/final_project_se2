require_relative "application_controller"

# User Controller
class ApplicationController < Sinatra::Base
	
	#to sign up 
	get "/signup" do
	    erb :'user/signup'
	end
	
	post "/signup" do 
	    user = User.new(:username => params[:username], :email => params[:email], :location => params[:location], :profile_picture => params[:profile_picture], :age => params[:age])
	    user.password = params[:password]

	    if user.save
	    	session[:user_id] = user.id
	        redirect('/')
	    else
	        redirect '/signup', :error => "There was an error signing up, please try again"
	    end
	end
	
	#to log in 
	get '/login' do
		erb :'user/login'
	end
	
	post '/login' do
		user = User.find_by(:username => params[:username])
		if user
			 if user.authenticate(params[:password])
			 	session[:user_id] = user.id 
			 	redirect('/search')
			 else
			 	redirect '/login', :error => "Your password is incorrect"
			 end
		else
			redirect '/login', :error => "We do not recognize your username"
		end
	end

	#to log out
	get '/logout' do
	    session[:user_id] = nil
	    redirect '/search'
	end
	
	#to see a profile
	get '/user/:id' do
	    @user = User.find(params[:id])
	    erb :'user/view'
	end
	
	get '/user/:id/clubs' do
		@user = User.find(params[:id])
		@clubs = @user.clubs
		erb :'user/clubs'
	end

	
end 