class User < ActiveRecord::Base
  attr_accessible :uid, :nickname, :email, :admin
end
