class ApplicationController < ActionController::Base
    #to make the helpers available
    include SessionsHelper

    private 

        #confirms a logged-in user
        def logged_in_user
            unless logged_in?
                store_location
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end
end
