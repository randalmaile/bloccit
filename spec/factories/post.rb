FactoryGirl.define  do
  factory :post do
    title "First Post"
    body "this is the newext post. It needs 20 char to be saved."
    user
    topic 
  end  
end