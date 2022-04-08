class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, presence: true, length: {minimum: 250} 
    validates :summary,  presence: true, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
        # message: "%{value} is not a valid category" }
    validate :clickbait?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]
    
      def clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end

end
