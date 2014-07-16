require 'rails_helper'

describe 'liking posts' do
	before do
		alex = User.create(email: 't@t.com', password: '12345678',password_confirmation: '12345678')
		alex.posts.create(title: 'cool post', description: 'hello world')
	end

	it 'is initially at 0 likes' do
		visit '/posts'
		expect(page).to have_link '♥ 0'
	end

	it 'increments the like count of a post' do
		visit '/posts'
		click_link '♥ 0'
		expect(page).to have_link '♥ 1'
	end

end