# Requires all dependencies in order for everything else to work
require "require_all" 
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require 'pry'
require "./config/environment"
require_all "app/models/*.rb"
require_all "app/controllers/*.rb"

# Creates the major controller that will hold all the routing information
class ApplicationController < Sinatra::Base
    
    # Registers sinatra/flash and sinatra/redirect_with_flash to make 
    # error handling much easier
    register Sinatra::Flash
    helpers Sinatra::RedirectWithFlash
    
    set :public_folder, 'public'
	set :views, 'app/views'
    
    # Sessions will be in charge of managing users logged information
    # * They can also be used for redirecting people if they've encountered errors
	enable :sessions
    set :session_secret, "banana"

    # Routing for '/'
    # Renders the header from the view folder  
	get "/" do
	    unless session[:user_id]
            redirect '/signup'
        else
            redirect '/search'
            @login_user = User.find(session[:user_id])
        end
	end
  
end
