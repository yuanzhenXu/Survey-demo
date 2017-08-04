class Answer < ApplicationRecord
  # attr_accessor :content, :question_id
  belongs_to :question

  # has_many :useranswers
end
