require 'rails_helper'

describe 'liking posts' do
	let(:alex) { User.create(email: 't@t.com', password: '12345678',password_confirmation: '12345678') }
	before do
		alex.posts.create(title: 'cool post', description: 'hello world')
	end

	it 'is initially at 0 likes' do
		visit '/posts'
		expect(page).to have_link '♥ 0'
	end

	# it 'increments the like count of a post', js: true do
	# 	visit '/posts'
	# 	click_link '♥ 0'

	# 	expect(page).to have_link '♥ 1'
	# end

	# it 'can only be liked once per user', js: true do
	# 	login_as alex
	# 	visit '/posts'
	# 	click_link '♥ 0'
	# 	sleep 2

	# 	click_link '♥ 1'
	# 	sleep 2

	# 	expect(page).to have_link '♥ 1'
	# end

	it 'turns grey once the user has liked', js: true do
		login_as alex
		visit '/posts'
		click_link '♥ 0'
		sleep 2
		# expect(page).to have_link '♥ 1'
		expect(page).to have_css '.disabled'
	end

end