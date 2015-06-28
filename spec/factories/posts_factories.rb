FactoryGirl.define do
  factory :post do 
    sequence(:status) { |n| "MyText #{n}" }
    published false
    publish_date "2015-05-31 21:48:19"
    user
  end
end