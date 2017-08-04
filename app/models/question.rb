class Question < ApplicationRecord
  has_many :answers
  has_many :options
  belongs_to :survey
end
