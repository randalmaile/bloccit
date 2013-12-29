require 'faker'
######
#Create 10 topics and populate a new array
topics = [] # - create an empty array
10.times do  # do 50 times - pass a block
  topics << Topic.create( # create a topic and assign as a hash to the topics array
    name: Faker::Lorem.words(rand(1..4)).join(" "), # create an array of 1 to 4 words - join them as a string - assign to name attribute
    description: Faker::Lorem.paragraph(rand(1..3))
    ) # create a string of 1 to 3 paragraphs - assign to description attribute
end
######

######
# Create 10 users AND create 10 posts for each of them
10.times do # - Outer iterator 10 times pass block to do - first part is to create new user
  password = Faker::Lorem.characters(10) #set password attribute (10 char pw) - set as local because repeated in User.new
  u = User.new( # create a new User instance
    name: Faker::Name.name, # - assign name
    email: Faker::Internet.email, # - assign email
    password: password, # - assign local to pw
    password_confirmation: password) # - assign local to pw_conf
  u.skip_confirmation! # - after all new user instances are created - skip the conf step to avoid sending out email
  u.save # - save users to db

  #Inner iterator - Create 10 posts per user -
  10.times do # - create 10 user posts for every user (this is called within the user creation block!!!!!!)
    topic = topics.first # - set the local to first topic
    p = u.posts.create( # - create a post within the scope of a unique user instance
      topic: topic,
      title: Faker::Lorem.words(rand(1..5)).join(" "), 
      body: Faker::Lorem.paragraphs(rand(1..3)).join("\n"))
    p.update_attribute(:created_at, Time.now - rand(600..31536000)) # set the created_at to a time within the past year
    p.update_rank
    topics.rotate! # add this line to move the first to the last so posts get assigned to each topic
  end
end
######

######
#For each user, create 10 comments and assign them to random posts
post_count = Post.count # - get the total number of posts
User.all.each do |user| # - for each user and pass a block to do
  40.times do #  - iterate 10 times 
    p = Post.find(rand(1..post_count)) # find a random post (this is important because any user can comment on any post)
    c = user.comments.create( # createa comment within the context (scope) of a pertucular user
      body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"),
      post: p) # associate the random post with the created user comment
    c.update_attribute(:created_at, Time.now - rand(600..31536000))
  end
end
######

######
#Create new users with all the possible roles - do this because the default user generator is only creating "member" types
u = User.new(
  name: 'Admin User',
  email: 'admin@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')
 
u = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'moderator')
 
u = User.new(
  name: 'Member User',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
 
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"