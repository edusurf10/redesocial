require 'rails_helper'

RSpec.describe User, type: :model do
  it "User is valid" do
    user  = User.new(
      name: "Luiz Eduardo", 
      email: "admin@admin.com", 
      phone: "48991200706", 
      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"),
      password: "123456"
    )

    expect(user).to be_valid 
  end

  it  "User is not valid - avatar" do
    user  = User.new(
      name: "Luiz Eduardo", 
      email: "admin@admin.com", 
      phone: "48991200706", 
      password: "123456"
    )

    expect(user).to_not be_valid 
  end

  it  "User is not valid - name" do
    user  = User.new(
      email: "admin@admin.com", 
      phone: "48991200706", 
      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"),
      password: "123456"
    )

    expect(user).to_not be_valid 
  end
end
