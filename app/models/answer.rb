class Answer < ApplicationRecord
  belongs_to :question

  validates :description, length: {minimum: 10}, presence: true
end
