FactoryBot.define do
  factory :user do
    name { "Luiz #{rand(99999999)}" }
    email { "admin#{rand(99999999)}@admin.com" } 
    phone { "48999999999" }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test-avatar.png'), 'image/png') }
    password {"123456"}
  end
end