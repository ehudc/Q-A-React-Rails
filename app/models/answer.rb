class Answer < ActiveRecord::Base
  belongs_to :question, foreign_key: "question_id"
end
