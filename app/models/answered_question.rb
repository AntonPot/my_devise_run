class AnsweredQuestion < ActiveRecord::Base
  belongs_to :response
  belongs_to :answer
  belongs_to :question
end
