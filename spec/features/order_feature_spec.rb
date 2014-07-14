require 'rails_helper'

describe 'orders page' do

	let(:post) {Post.create}
	let(:user) {User.create email: 'customer@blah.com', password: '12345678', password_confirmation: '12345678'}
	let(:admin) {Admin.create email: 't@t.com', password: '12345678', password_confirmation: '12345678'}

	context 'logged in as admin' do
		context 'no orders' do
			it 'sees a message' do
				visit '/orders'
				expect(page).to have_content 'No orders yet :-('
			end
		end
	end

	context 'not logged in as admin' do
		it 'prompts to sign in' do
			visit '/orders' 
			expect(page).to have_content 'Sign in'
		end
	end

end