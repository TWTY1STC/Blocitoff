class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def edit_spam
    posts.each do |post|
      if post_id % 5 == 0
        post.update_attributes(:title => "SPAM")
      end
    end
  end

end
