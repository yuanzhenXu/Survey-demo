class Survey < ApplicationRecord

  has_many :questions
  # accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  validates :name, :presence => true, length: { minimum: 5 }
end
