class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    unless record.title && record.title.include?("True Facts")
      record.errors[:title] << "Title must be clickbait"
    end
  end
end
