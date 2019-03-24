require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :number_of_pages}
    it { should validate_presence_of :publish_year}
  end
  describe "relationships" do
    it { should have_many(:authors).through :book_authors}
    it { should have_many :reviews}
  end

  describe "Class Methods" do
    before :each do
      @book_1 = Book.create!(title: "Book 1", number_of_pages: 100, publish_year: 1900, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
      @book_2 = Book.create!(title: "Book 2", number_of_pages: 200, publish_year: 1950, cover: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
      @book_3 = Book.create!(title: "Book 3", number_of_pages: 300, publish_year: 2000, cover:"https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg")
      @book_4 = Book.create!(title: "Book 4", number_of_pages: 100, publish_year: 2010, cover:"https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg")
      @book_1.reviews.create!(title: "Book 1 Review", rating: 5, review_text: "This is book 1.", username: "Oink1")
      @book_1.reviews.create!(title: "Book 1 Review 2", rating: 3, review_text: "This is another review for 1.", username: "Pig1")
      @book_1.reviews.create!(title: "Book 1 Review 3", rating: 1, review_text: "This is yet another review for 1.", username: "Pig2")
      @book_2.reviews.create!(title: "Book 2 Review", rating: 3, review_text: "This is book 2.", username: "Oink2")
      @book_3.reviews.create!(title: "Book 3 Review", rating: 1, review_text: "This is book 3.", username: "Oink3")
      @book_4.reviews.create!(title: "Book 4 Review", rating: 4, review_text: "This is book 4.", username: "Oink4")
    end

    it ".top_books" do
      #@book_1 has two top ratings, but should only display one
      expect(Book.top_books).to eq([@book_1, @book_4, @book_2])
    end

    it ".worst_books" do
      #@book_1 has two top ratings, but should only display one
      expect(Book.worst_books).to eq([@book_1, @book_3, @book_2])
    end
  end

  describe "Instance Methods" do
    before :each do
      @book_1 = Book.create!(title: "Book 1", number_of_pages: 100, publish_year: 1900, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
      @book_2 = Book.create!(title: "Book 2", number_of_pages: 200, publish_year: 1950, cover: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
      @book_3 = Book.create!(title: "Book 3", number_of_pages: 300, publish_year: 2000, cover:"https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg")
      @book_4 = Book.create!(title: "Book 4", number_of_pages: 100, publish_year: 2010, cover:"https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg")
      @book_1.reviews.create!(title: "Book 1 Review", rating: 3, review_text: "This is book 1.", username: "Oink1")
      @book_1.reviews.create!(title: "Book 1 Review 2", rating: 5, review_text: "This is another review for 1.", username: "Pig1")
      @book_1.reviews.create!(title: "Book 1 Review 3", rating: 1, review_text: "This is yet another review for 1.", username: "Pig2")
      @book_1.reviews.create!(title: "Book 1 Review 4", rating: 2, review_text: "This is yet yet another review for 1.", username: "Pig3")
      @book_2.reviews.create!(title: "Book 2 Review", rating: 3, review_text: "This is book 2.", username: "Oink2")
      @book_3.reviews.create!(title: "Book 3 Review", rating: 1, review_text: "This is book 3.", username: "Oink3")
      @book_4.reviews.create!(title: "Book 4 Review", rating: 4, review_text: "This is book 4.", username: "Oink4")
    end

    it "#average_rating" do
      expect(@book_1.average_rating).to eq(2.75)
    end

    it "#total_reviews" do
      expect(@book_1.total_reviews).to eq(4)
    end

    it "#max_rating" do
      expect(@book_1.max_rating).to eq(5)
    end

    it "#min_rating" do
      expect(@book_1.min_rating).to eq(1)
    end

    it "#top_reviews" do
      expect(@book_1.top_reviews).to eq([@book_1.reviews[1], @book_1.reviews[0], @book_1.reviews[3]])
    end

  end
end
