module UsersHelper
    def user_activity_empty?
        @user.comments.empty? && @user.posts.empty?
    end
    
    def user_comments_empty?
        @user.comments.empty?
    end
    
    def user_posts_empty?
        @user.comments.empty?
    end
end
