require 'random_data'

#create Posts
50.times do
    Post.create!(
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

#create idempotent instance
post = Post.find_or_create_by( title: "My unique post", body: "My unique body")
comment = Comment.find_or_create_by(post: post, body: "My unique body")

#create Advertisements
50.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end

posts =  Post.all


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"

    