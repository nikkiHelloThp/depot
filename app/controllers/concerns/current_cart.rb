module CurrentCart # in concerns directory to share among all controllers

	private # prevent the method not to be available as an action in controller

	def set_cart
		@cart = Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		@cart             = Cart.create
		session[:cart_id] = @cart.id
	end
end