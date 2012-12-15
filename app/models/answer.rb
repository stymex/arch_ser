class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :votes
  belongs_to :question
end
