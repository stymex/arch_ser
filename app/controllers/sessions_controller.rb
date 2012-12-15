class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_all_by_uid_and_nickname(auth_hash["uid"],auth_hash["info"]["nickname"]);
    session["uid"]=auth_hash["uid"]
    session["nickname"]=auth_hash["info"]["nickname"]
    if user.count > 0
    else
      user = User.new :uid => auth_hash["uid"], :nickname=> auth_hash["info"]["nickname"], :email =>auth_hash["info"]["email"], :admin => false
      user.save
    end
    redirect_to '/'
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session["uid"] = nil
    redirect_to '/'
  end

end
