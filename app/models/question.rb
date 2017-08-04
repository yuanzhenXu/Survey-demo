class Question < ApplicationRecord
  belongs_to :survey

  has_many :answers
  # accepts_nested_attributes_for :answers, allow_destroy: true
  # has_many :options

  accepts_nested_attributes_for :answers, :reject_if => lambda {|a| a[:content].blank? }, :allow_destroy => true
end
