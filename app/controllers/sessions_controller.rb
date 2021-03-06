class SessionsController < ApplicationController
	def new
	end

	def create
		# user = User.find_by(username: params[:session][:username].downcase)
		user = User.find_by(username: params[:session][:username].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Hatalı kullanıcı adı/şifre kombinasyonu'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end