class User < ActiveRecord::Base
  attr_accessible :admin, :created, :email, :nickname, :uid
end
