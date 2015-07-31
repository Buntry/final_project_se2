require_relative "application_controller"

# Club Controller
class ApplicationController < Sinatra::Base
    
    get '/clubs/all' do
        @clubs = Club.all
        erb :'club/index'
    end
    
    #to search for clubs 
    get '/search' do
        @clubs = []
        erb :'club/index'
    end
    
    post '/search' do
        @clubs = search_clubs(params[:query])
        erb :'club/index'
    end
    
    #to create a new club
	get '/new_club' do
	    if logged
    		erb :'club/new_club'
		else
		    redirect "/search", :error => 'You have to log in before you create a club'
		end
	end
	
	post '/new_club' do
		club = draft_club(logged, params)
		
		if club.save
            redirect "/club/#{club.id}"
        else
            redirect '/new_club'
        end
	end
	
	get '/club/:id' do
	    @club = Club.find(params[:id])
	    erb :'club/view'
	end
    
    post '/club/:id' do 
        join_club(params[:id])
        redirect "/club/#{params[:id]}"
    end
    
    get '/club/:id/members' do
        @club = Club.find(params[:id])
        @users = @club.users
        erb :'club/members'
    end
    
    
end