class Survey < ApplicationRecord
  has_many :question, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }
end
