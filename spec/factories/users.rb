FactoryBot.define do
  factory :user do
    email 'fancyfrank@gmail.com'
    user_name 'Arnie'
    password 'illbeback'
    id 1
  end

  factory :short_name_user, class: User do
    email 'fancyfrank@gmail.com'
    user_name 'Ar'
    password 'illbeback'
    id 1
  end
end
