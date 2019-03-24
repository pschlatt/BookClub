require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :rating}
    it { should validate_presence_of :review_text}
    it { should validate_presence_of :username}
  end
  describe "relationships" do
    it { should belong_to :book}
  end

  describe "Class Methods" do
    before :each do
      @book_1 = Book.create(title: "In Search Of Lost Time", number_of_pages: 4215, publish_year: 1913, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
      @author_1 = @book_1.authors.create(name: "Marcel Proust")
      @book_2 = Book.create(title: "Don Quixote", number_of_pages: 928, publish_year: 1605, cover: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
      @author_2 = @book_2.authors.create(name: "Miguel de Cervantes")
      @book_3 = Book.create(title: "Ulysses", number_of_pages: 730, publish_year: 1922, cover: "https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg")
      @author_3 = @book_3.authors.create(name: "James Joyce")
      @book_4 = Book.create(title: "The Talisman", number_of_pages: 921, publish_year: 1984, cover: "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg")
      @author_4 = @book_4.authors.create(name: "Peter Straub, Stephen King")

      @review_1 = @book_1.reviews.create(title: "Review Title 1", rating: 1, review_text: "This is the 1st review.", username: "UserYou1")
      @review_2 = @book_1.reviews.create(title: "Review Title 2", rating: 3, review_text: "This is the 2nd review.", username: "UserYou2")
      @review_3 = @book_1.reviews.create(title: "Review Title 3", rating: 5, review_text: "This is the 3rd review.", username: "UserYou3")
      @review_4 = @book_1.reviews.create(title: "Review Title 4", rating: 2, review_text: "This is the 4th review.", username: "UserYou4")

      @review_5 = @book_2.reviews.create(title: "Review Title 5", rating: 1, review_text: "This is the 1st review.", username: "UserYou3")
      @review_6 = @book_2.reviews.create(title: "Review Title 6", rating: 3, review_text: "This is the 2nd review.", username: "UserYou2")
      @review_7 = @book_2.reviews.create(title: "Review Title 7", rating: 4, review_text: "This is the 3rd review.", username: "UserYou1")

      @review_8 = @book_3.reviews.create(title: "Review Title 8", rating: 3, review_text: "This is the 1st review.", username: "UserYou1")
      @review_9 = @book_3.reviews.create(title: "Review Title 8", rating: 3, review_text: "This is the 1st review.", username: "UserYou2")
    end

    it ".top_reviewers" do
      expect(Review.top_reviewers).to eq([["UserYou1", 3], ["UserYou2", 3], ["UserYou3", 2]])
    end
  end

  describe "Instance Methods" do
    before :each do
      @book_1 = Book.create(title: "In Search Of Lost Time", number_of_pages: 4215, publish_year: 1913, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
      @author_1 = @book_1.authors.create(name: "Marcel Proust")
      @book_2 = Book.create(title: "Don Quixote", number_of_pages: 928, publish_year: 1605, cover: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
      @author_2 = @book_2.authors.create(name: "Miguel de Cervantes")
      @book_3 = Book.create(title: "Ulysses", number_of_pages: 730, publish_year: 1922, cover: "https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg")
      @author_3 = @book_3.authors.create(name: "James Joyce")
      @book_4 = Book.create(title: "The Talisman", number_of_pages: 921, publish_year: 1984, cover: "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg")
      @author_4 = @book_4.authors.create(name: "Peter Straub, Stephen King")

      @review_1 = @book_1.reviews.create(title: "Review Title 1", rating: 1, review_text: "This is the 1st review.", username: "UserYou1")
      @review_2 = @book_1.reviews.create(title: "Review Title 2", rating: 3, review_text: "This is the 2nd review.", username: "UserYou2")
      @review_3 = @book_1.reviews.create(title: "Review Title 3", rating: 5, review_text: "This is the 3rd review.", username: "UserYou3")
      @review_4 = @book_1.reviews.create(title: "Review Title 4", rating: 2, review_text: "This is the 4th review.", username: "UserYou4")

      @review_5 = @book_2.reviews.create(title: "Review Title 5", rating: 1, review_text: "This is the 1st review.", username: "UserYou3")
      @review_6 = @book_2.reviews.create(title: "Review Title 6", rating: 3, review_text: "This is the 2nd review.", username: "UserYou2")
      @review_7 = @book_2.reviews.create(title: "Review Title 7", rating: 4, review_text: "This is the 3rd review.", username: "UserYou1")

      @review_8 = @book_3.reviews.create(title: "Review Title 8", rating: 3, review_text: "This is the 1st review.", username: "UserYou1")
      @review_9 = @book_3.reviews.create(title: "Review Title 8", rating: 3, review_text: "This is the 1st review.", username: "UserYou2")
    end
  end
end
