class AdminsController < ApplicationController
  
  before_filter :auth
  def auth
    if !session["uid"].present?
      redirect_to "/auth/github"
    end
    user = User.find_by_uid(session["uid"])
    if !user.admin
      render :text => "Access Denied!"
    end
  end
  
  def view
  end

  def data
    @users = User.all()
  end


  def dbaction
    #called for all db actions
    uid = params["c0"]
    nickname = params["c1"]
    email = params["c2"]
    admin = params["c3"]

    @mode = params["!nativeeditor_status"]

    @id = params["gr_id"]
    case @mode
    when "inserted"
      user = User.new
      user.uid = uid
      user.nickname = nickname
      user.email = email
      user.admin = admin
      user.save!

      @tid = user.id
    when "deleted"
      user=User.find(@id)
      user.destroy

      @tid = @id
    when "updated"
      user=User.find(@id)
      user.uid = uid
      user.nickname = nickname
      user.email = email
      user.admin = admin
      user.save!

      @tid = @id
    end
  end
end