class Question <ActiveRecord::Base
  has_many :answers

  validates :title, presence: true, length: { minimum: 20, too_short: "%{count} characters is the minimum allowed"}
  validates :description, presence: true, length: { minimum: 100, too_short: "%{count} characters is the minimum allowed"}
end
