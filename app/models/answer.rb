class Answer < ActiveRecord::Base
  # belongs_to :question
  has_many :answered_questions
end
