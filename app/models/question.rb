class Question < ApplicationRecord
  has_many :answers

  validates :title, length: { minimum: 20}, presence: true
  validates :description, length: { minimum: 25 }, presence: true

end
