require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it "User can fallow another user" do
    mat = FactoryBot.create(:user)
    bob = FactoryBot.create(:user)
    Subscription.create(followed: bob, followed_by: mat)

    expect(bob.followers.count).to eql 1
    expect(bob.followers).to include mat 

    expect(mat.following.count).to eql 1
    expect(mat.following).to include bob 

    expect(bob.following.count).to eql 0
    expect(bob.following).to_not include mat

    expect(mat.followers.count).to eql 0
    expect(mat.followers).to_not include bob

    donald = FactoryBot.create(:user)
    Subscription.create(followed: bob, followed_by: donald)

    expect(bob.followers.count).to eql 2
    expect(bob.followers).to include donald 

    expect(donald.following.count).to eql 1
    expect(donald.following).to include bob 
  end
end
