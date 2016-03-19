module SessionsHelper
    
    def create_session(user)
        session[:user_id] = user.id
    end
    #sets user_id on the session object to user.id, can only have one user id per session
    
    def destroy_session(user)
        session[:user_id] = nil
    end
    #clears the user id on the session object
    
    def current_user
        User.find_by(id: session[:user_id])
    end
    #provides a shortcut in our code for anytime we need to find a user for the session

    def avatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
    
end
