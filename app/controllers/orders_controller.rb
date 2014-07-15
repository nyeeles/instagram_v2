class OrdersController < ApplicationController
	before_action :authenticate_admin!
	
	def index
		authenticate_admin!
		@orders = Order.all
	end
end
