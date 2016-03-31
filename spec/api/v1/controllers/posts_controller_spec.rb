require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
    let(:my_user) {create(:user)}
    let(:my_topic) {create (:topic)}
    let(:my_post) {create(:post, topic: my_topic, user: my_user)}
    
    context "unauthenticated user" do
        it "PUT update returns http unauthenticated" do
           put :update, topic_id: my_topic.id, post:{title: "New Post", body: "Post content in here."}
           expect(response).to have_http_status(401)
        end
 
        it "POST create returns http unauthenticated" do
           post :create, topic_id: my_topic.id, post:{title: "New Post", body: "Post content in here."}
           expect(response).to have_http_status(401)
        end
     
        it "DELETE destroy returns http unauthenticated" do
           delete :destroy, id: my_post.id
           expect(response).to have_http_status(401)
        end
        
    end
    
    context "authenticated and unauthorized users" do
        
        it "PUT update returns http forbidden" do
           put :update, topic_id: my_topic.id, post:{title: "New Post", body: "Post content in here."}
           expect(response).to have_http_status(403)
        end
 
        it "POST create returns http forbidden" do
           post :create, topic_id: my_topic.id, post:{title: "New Post", body: "Post content in here."}
           expect(response).to have_http_status(403)
        end
     
        it "DELETE destroy returns http forbidden" do
           delete :destroy, id: my_post.id
           expect(response).to have_http_status(403)
        end
    end
    
    context "authenticated and authorized users" do
     before do
       my_user.admin!
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
       @new_post = build(:post, topic: my_topic, user: my_user)
     end
     
        describe "PUT update" do
         
        end
         
        describe "POST create" do
             
        end
         
        describe "DELETE destroy" do
             
        end
    end
end