FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@example.com"
  end

  sequence :ido_id do |n|
    "3ag9dh2jd8bf#{n}"
  end

  sequence :title do |n|
    "Ticket title-#{n}"
  end

  sequence :message do |n|
    "message-#{n}"
  end

  sequence :first_name do |n|
    "John-#{n}"
  end

  factory :user do
    email
    password "password"
    first_name
    last_name "Doe"
    
    trait :bushido_authenticated do
      ido_id
      type "Admin"
    end

    factory :admin_user, :traits => [:bushido_authenticated]
  end

  factory :ticket do
    title
    message
    user { Factory :user }
  end

  factory :activity do
    user

    trait :commented do
      message
      action "comment"
    end

    trait :reopened do
      action "reopen"
    end

    trait :closed do
      action "close"
    end

    factory :commented_ticket, :traits => [:commented]
    factory :reopened_ticket, :traits => [:reopened]
    factory :closed_ticket,   :traits => [:closed]
  end
end
