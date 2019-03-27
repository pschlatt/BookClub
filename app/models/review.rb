class Review < ApplicationRecord
  validates_presence_of :title,
                        :rating,
                        :review_text,
                        :username,
                        :created_at

  belongs_to :book

  def self.top_reviewers
    reviews_3 = Review.group(:username).count.take(3)
  end

  def self.reviews_by_user
    select(:username)
  end



end
