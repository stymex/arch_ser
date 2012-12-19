class Answer < ActiveRecord::Base
  attr_accessible :id,:content, :question_id, :votes
  belongs_to :question
end
