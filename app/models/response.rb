class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :answered_questions
end
