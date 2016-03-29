class FavoriteMailer < ApplicationMailer
    default cc: "liza.njuguna@gmail.com, chris@bloc.io",
            from: "liza.njuguna@gmail.com"
    
    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@secure-oasis-87797.herokuapp.com>"
        headers["In-Reply_To"] = "<post/#{post.id}@secure-oasis-87797.herokuapp.com>"
        headers["References"] = "<post/#{post.id}>@secure-oasis-87797.herokuapp.com"
        
        @user = user
        @post = post
        @comment = comment
        
        mail(to: user.email, subject: "New comment on #{post.title}")
    end
    
    def new_post(user, post)
        headers["Message-ID"] = "<post/#{post.id}@secure-oasis-87797.herokuapp.com>"
        headers["In-Reply_To"] = "<post/#{post.id}@secure-oasis-87797.herokuapp.com>"
        headers["References"] = "<post/#{post.id}>@secure-oasis-87797.herokuapp.com"
        
        @user = user
        @post = post
        
        mail(to: user.email, subject: "#{post.title} has been added to your favorites")
    end
    
end
