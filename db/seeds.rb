require 'random_data'
#create Users
5.times do
    User.create!(
        name: RandomData.random_name, 
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end
users = User.all

#create Topics
15.times do
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end
topics = Topic.all

#create Posts
50.times do
    Post.create!(
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts =  Post.all

#create Comments
100.times do
    Comment.create!(
        post: posts.sample, 
        body: RandomData.random_paragraph
    )
end

post = Post.find_or_create_by( title: "My unique post", body: "My unique body")
comment = Comment.find_or_create_by(post: post, body: "My unique body")

user = User.first
user.update_attributes!(
    email: "ewgoldhammer@gmail.com",
    password: "helloworld"
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
    