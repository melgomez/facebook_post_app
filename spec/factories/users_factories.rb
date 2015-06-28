FactoryGirl.define do

  factory :user do |f|
    
    f.sequence(:id) { |n| "#{n}" }
    f.sequence(:name) { |n| "User Name #{n}" }
    f.provider "Facebook"
    f.sequence(:uid) { |n| "#{n}" }

    factory :user_with_posts do
      after(create) do |user|
        create_list(:post, user: user)
      end
    end
  end

end

