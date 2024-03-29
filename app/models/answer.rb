class Answer < ActiveRecord::Base
  belongs_to :question

  validates :description, presence: true, length: { minimum: 50, too_short: "%{count} characters is the minimum allowed"}
  validates :question_id, presence: true
end
