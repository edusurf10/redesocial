FactoryBot.define do
  factory :user do
    name { "Luiz" }
    email { "admin@admin.com" } 
    phone { "48991200706" }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test-avatar.png'), 'image/png') }
    password {"123456"}
  end
end