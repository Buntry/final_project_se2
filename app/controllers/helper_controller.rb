require_relative "application_controller"

# Helper Controller
class ApplicationController < Sinatra::Base
    
    helpers do
        
        def logged
            session[:user_id]
        end
        
        def logged=(arg)
            session[:user_id] = arg
        end
        
        def draft_club(user_id, h = {})
            c = Club.new({
                owner_id: user_id,
                name: h[:name],
                description: h[:description],
                image_url: h[:image_url],
                keyword_list: h[:keyword_list],
                contact_info: h[:contact_info]
            })
            return c
        end
        
        def draft_activity(user_id, club_id, h = {})
            a = Activity.new({
                owner_id: user_id,
                club_id: club_id,
                name: h[:name],
                description: h[:description],
                date: h[:date],
                time: h[:time],
                length: h[:length],
                location: h[:location]
            })
            return a
        end
        
        def club_includes?(club_id, user_id)
            club = Club.find(club_id)
            club.users.each do |user|
                if user.id == user_id
                    return true
                end
            end
            
            return false
        end
        
        def activity_includes?(activity_id, user_id)
            activity = Activity.find(activity_id)
                activity.users.each do |user|
                    if user.id == user_id
                        return true
                    end
                end
            return false
        end
        
        def search_clubs(query)
            results = []
            Club.all.each do |club|
                club.parse.each do |keyword|
                    if keyword.downcase == query.downcase
                        unless results.include?(club)
                            results << club
                        end
                    end
                end
            end
            return results
        end
        
        def join_club(club_id)
            if logged
                UserClub.create(
                    user_id: logged,
                    club_id: club_id
                    )
            else
                redirect "/club/#{@club.id}"
            end
        end
        
        def join_activity(activity_id)
            if logged
                UserActivity.create(
                    user_id: logged,
                    activity_id: activity_id
                    )
            else
                redirect "/club/#{@club.id}"
            end
        end
    end
    
end