FactoryBot.define do
  factory :post do
    caption { 'nofilter' }
    image { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpg', 'image/jpg') }
    user
  end

  factory :invalid_post do
    caption { nil }
    image { nil }
  end
end
