class CommentsController < ApplicationController
    
    before_action :require_sign_in
    before_action :authorize_user, only: [:destroy]
    
    #how to update this to evaluate only which instance we are referring to (topic or post)
    # instance = @post || @topic , then sub all @--s with instance, except the first line where need Class.find
    
    def create
      @post = Post.find(params[:post_id]) || @topic = Topic.find(params[:topic_id])
      comment = @post.comments.new(comment_params) || comment = @topic.comments.new(comment_params)
      comment.user = current_user
      
      if comment.save
        flash[:notice] = "Comment saved successfully."
        redirect_to [@post.topic, @post] || [@topic.topics, @topic]
      else
        flash[:alert] = "Comment failed to save."
        redirect_to [@post.topic, @post] || [@topic.topics, @topic]
      end
    end
    
    def destroy
      @post = Post.find(params[:post_id]) || @topic = Topic.find(params[:topic_id])
      comment = @post.comments.find(params[:id]) || comment = @topic.comments.find(params[:id])
      
      if comment.destroy
        flash[:notice] = "Comment was deleted."
        redirect_to [@post.topic, @post] || [@topic.topics, @topic]
      else
        flash[:alert] = "Comment couldn't be deleted. Try again."
        redirect_to [@post.topic, @post] || [@topic.topics, @topic]
      end
    end
    
    
    private
    
    def comment_params
        params.require(:comment).permit(:body)
    end
    
    def authorize_user
        comment = Comment.find(params[:id])
        unless current_user == comment.user || current_user.admin?
            flash[alert] = "You do not have permission to delete a comment."
            redirect_to [comment.post.topic, comment.post]
        end
    end
end
