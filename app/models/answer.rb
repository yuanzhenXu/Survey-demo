class Answer < ApplicationRecord
  belongs_to :question
  # attr_accessible :content, :question_id

  # has_many :useranswers
end
