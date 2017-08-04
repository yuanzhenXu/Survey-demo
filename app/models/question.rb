class Question < ApplicationRecord
  attr_accessor :title, :survey_id, :answers_attributes
  belongs_to :survey

  has_many :answers, :dependent => :destroy
  has_many :options

  # accepts_nested_attributes_for :answers, :reject_if => lambda {|a| a[:content].blank? }, :allow_destroy => true

end
