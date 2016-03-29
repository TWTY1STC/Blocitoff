class CommentsController < ApplicationController
    
    before_action :require_sign_in
    before_action :authorize_user, only: [:destroy]
    
    
    def create
      @post ? Post.find(params[:post_id]) : @topic = Topic.find(params[:topic_id])
      comment = @post ? @post.comments.new(comment_params) : @topic.comments.new(comment_params)
      comment.user = current_user
      
      if comment.save
        flash[:notice] = "Comment saved successfully."
        redirect_path = @post ? topic_post_path(@post.topic, @post) : topic_path(@topic)
        redirect_to redirect_path
      else
        flash[:alert] = "Comment failed to save."
        redirect_path = @post ? topic_post_path(@post.topic, @post) : topic_path(@topic)
        redirect_to redirect_path
      end
    end
    
    def destroy
      @post ? Post.find(params[:post_id]) : @topic = Topic.find(params[:topic_id])
      comment = @post ? @post.comments.new(comment_params) : @topic.comments.new(comment_params)
      
      if comment.destroy
        flash[:notice] = "Comment was deleted."
        redirect_path = @post ? topic_post_path(@post.topic, @post) : topic_path(@topic)
        redirect_to redirect_path      
      else
        
        flash[:alert] = "Comment couldn't be deleted. Try again."
        redirect_path = @post ? topic_post_path(@post.topic, @post) : topic_path(@topic)
        redirect_to redirect_path      
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
