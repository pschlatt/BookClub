require 'rails_helper'

RSpec.describe "author showpage", type: :feature do
  before :each do
    @author_1 = Author.create(name: "Erin King")
    @author_2 = Author.create(name: "Noah Flintastical")
    @book_1 = @author_1.books.create(title: "Book_1", number_of_pages: 5, publish_year: 1900, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
    @book_2 = @author_1.books.create(title: "Book_2", number_of_pages: 10, publish_year: 1910, cover: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
    @book_3 = @author_1.books.create(title: "Book_3", number_of_pages: 50, publish_year: 1920, cover: "https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg")
    @book_4 = @author_1.books.create(title: "Book_4", number_of_pages: 500, publish_year: 1930, cover: "https://images-na.ssl-images-amazon.com/images/I/51vv75oglyL._SX326_BO1,204,203,200_.jpg")
    @book_5 = @author_1.books.create(title: "Book_5", number_of_pages: 100, publish_year: 1940, cover: "https://images-na.ssl-images-amazon.com/images/I/81vjde0JFHL.jpg")
    @book_1.authors << @author_2

    @review_1 = @book_1.reviews.create(title: "Review Title 1", rating: 1, review_text: "This is the 1st review.", username: "UserYou1")
    @review_2 = @book_1.reviews.create(title: "Review Title 2", rating: 3, review_text: "This is the 2nd review.", username: "UserYou2")
    @review_3 = @book_2.reviews.create(title: "Review Title 5", rating: 1, review_text: "This is the 1st review.", username: "UserYou3")
    @review_4 = @book_2.reviews.create(title: "Review Title 6", rating: 3, review_text: "This is the 2nd review.", username: "UserYou2")
    @review_5 = @book_3.reviews.create(title: "Review Title 8", rating: 3, review_text: "This is the 1st review.", username: "UserYou1")
    @review_6 = @book_3.reviews.create(title: "Review Title 8", rating: 3, review_text: "This is the 2nd review.", username: "UserYou2")
    @review_7 = @book_4.reviews.create(title: "Review Title 3", rating: 5, review_text: "This is the 3rd review.", username: "UserYou3")
    @review_8 = @book_4.reviews.create(title: "Review Title 4", rating: 2, review_text: "This is the 4th review.", username: "UserYou4")
    @review_9 = @book_5.reviews.create(title: "Review Title 3", rating: 5, review_text: "This is the 3rd review.", username: "UserYou3")
    @review_10 = @book_5.reviews.create(title: "Review Title 4", rating: 2, review_text: "This is the 4th review.", username: "UserYou4")

  end

  it "shows a page with author information" do

    visit author_path(@author_1)

    expect(current_path).to eq(author_path(@author_1))
    expect(page).to have_content(@author_1.name)

    within "#author-books" do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.number_of_pages)
      expect(page).to have_content(@book_1.publish_year)
      expect(page).to have_content(@author_2.name)
      expect(page).to_not have_content(@author_1.name)
      expect(page).to have_css("img[src*='#{@book_1.cover}']")
    end
  end

  it "shows the top review for each book" do

    visit author_path(@author_1)

    within "#author-books" do
      within "#author-reviews" do
        expect(page).to have_content(@review_2.title)
        expect(page).to have_content(@review_2.rating)
        expect(page).to have_content(@review_2.username)
      end
    end
  end

  it "deletes an author and returns to book index page" do

    visit author_path(@author_2)

    click_link "Delete Author"

    expect(current_path).to eq(books_path)
    expect(page).to_not have_content(@author_2.name)
    expect(page).to_not have_content(@book_1.title)
    expect(page).to have_content(@author_1.name)
    # ?test @author_1 was not deleted if no book
  end
end
