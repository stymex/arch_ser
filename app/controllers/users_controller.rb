class UsersController < ApplicationController

  before_filter :auth
  def auth
    if !session["uid"].present?
      redirect_to "/login"
    end
    
    user = User.find_all_by_uid(session["uid"])

  end

end
