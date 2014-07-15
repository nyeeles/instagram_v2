class ChargesController < ApplicationController

	def new
		@post = Post.find params[:post_id]
	end

	def create
		@post = Post.find params[:post_id]
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  Order.create(user: current_user, post: @post)

	# rescue Stripe::CardError => e
	  flash[:notice] = "Thank you for your order!"
	  redirect_to posts_path
	end
	
end
