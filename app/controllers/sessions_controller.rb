class SessionsController < ApplicationController
	def new
	end

	def create
		auth_hash = request.env['omniauth.auth']
		user = User.find_all_by_uid_and_nickname(auth_hash["uid"],auth_hash["info"]["nickname"]);
    if user.count > 0 
      render :text => "Welcome back! You have already signed up."
    else
      user = User.new :uid => auth_hash["uid"], :nickname=> auth_hash["info"]["nickname"], :email =>auth_hash["info"]["email"], :admin => false
      user.save
      render :text => "Hi! You've signed up."
    end
	end

	def failure
	end
	

end
