class Review < ApplicationRecord
  validates_presence_of :title,
                        :rating,
                        :review_text,
                        :username
  belongs_to :book
end
