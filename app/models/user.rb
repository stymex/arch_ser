# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  uid        :integer
#  nickname   :string(255)
#  email      :string(255)
#  admin      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :uid, :nickname, :email, :admin
end
