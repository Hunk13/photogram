FactoryBot.define do
  factory :user do
    email { 'fancyfrank@gmail.com' }
    user_name { 'Arnie' }
    password { 'illbeback' }
  end

  factory :short_name_user, class: User do
    email { 'fancyfrank@gmail.com' }
    user_name { 'Ar' }
    password { 'illbeback' }
  end
end
