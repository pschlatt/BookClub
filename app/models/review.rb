class Review < ApplicationRecord
  validates_presence_of :title,
                        :rating,
                        :review_text,
                        :username
  belongs_to :book

  def self.top_reviewers
    reviews = Review.all
    reviewers_hash = reviews.group_by do |review|
      review.username
    end
    reviewer_count = reviewers_hash.map do |reviewer, reviews|
      [reviewer, reviews.size]
    end
    reviewer_count.sort.first(3)
  end

  def self.reviews_by_user
    select(:username)
  end

end
