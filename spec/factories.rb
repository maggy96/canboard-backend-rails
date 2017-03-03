FactoryGirl.define do
  factory :user do
    name "Thomas A. Anderson"
    email "thomas.a.anderson@metacortex.com"
    password "ilovetrinity"
  end

  factory :board do
    title "Project: Exit Matrix"
    description "Follow the white rabbit"
    user_id 1
  end
end
