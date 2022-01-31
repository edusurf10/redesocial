require 'rails_helper'

RSpec.describe Like, type: :model do
  it "User likes a post" do
    caio = FactoryBot.create(:user)
    mateus = FactoryBot.create(:user)
    joao = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: caio)

    Like.create(user: joao, post: post)
    expect(post.likes.count).to eql 1
    expect(post.likes.first.user).to eql joao

    Like.create(user: mateus, post: post)
    expect(post.likes.count).to eql 2
    expect(post.likes.last.user).to eql mateus

    Like.find_by(post: post, user: joao).destroy
    expect(post.likes.count).to eql 1
    expect(post.likes.first.user).to eql mateus
  end
end
