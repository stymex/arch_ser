class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_all_by_uid_and_nickname(auth_hash["uid"],auth_hash["info"]["nickname"]);
    session["uid"]=auth_hash["uid"]
    if user.count > 0
      render :text => "Welcome back! You have already signed up."
    else
      user = User.new :uid => auth_hash["uid"], :nickname=> auth_hash["info"]["nickname"], :email =>auth_hash["info"]["email"], :admin => false
      user.save
      render :text => "You've signed up."
    end
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session["uid"] = nil
    render :text => "You've logged out!"
  end

end
