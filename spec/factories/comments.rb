FactoryBot.define do
  factory :comment do
    content { 'Nice post!' }
    user
    post
  end
end
