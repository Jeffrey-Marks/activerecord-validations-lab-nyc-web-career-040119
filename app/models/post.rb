class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with ClickbaitValidator

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :title_is_clickbait?

  def title_is_clickbait?
    if self.title && !self.title.include?("You Won't Believe These True Facts")
      errors.add(:title, "title is not clickbait")
    end
  end
end
