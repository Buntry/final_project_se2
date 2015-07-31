require_relative "application_controller"

# Activity Controller
class ApplicationController < Sinatra::Base
    #to create a new activity
    
    get '/club/:id/new_activity' do
        @club = Club.find(params[:id])
        erb :'activity/new_activity'
    end
    
    post '/club/:id/new_activity' do
        activity = draft_activity(logged, params[:id], params)
        
        if activity.save
            redirect "/club/#{params[:id]}"
        else
            redirect "/club/#{params[:id]}/new_activity", :error => 'Something went wrong when you tried creating an activity'
        end
        
    end
    
    post '/club/:id/join_activity' do 
        join_activity(params[:activity_id].to_i)
        redirect "/club/#{params[:id]}"
    end
    
end