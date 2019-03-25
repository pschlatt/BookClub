require 'rails_helper'

RSpec.describe "author showpage", type: :feature do
  before :each do
    @author = Author.create(name: "Erin King")
    @book_1 = @author.books.create(title: "Book_1", number_of_pages: 5, publish_year: 1900, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
    @book_2 = @author.books.create(title: "Book_2", number_of_pages: 10, publish_year: 1910, cover: "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg")
    @book_3 = @author.books.create(title: "Book_3", number_of_pages: 50, publish_year: 1920, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
    @book_4 = @author.books.create(title: "Book_4", number_of_pages: 500, publish_year: 1930, cover: "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg")
    @book_5 = @author.books.create(title: "Book_5", number_of_pages: 100, publish_year: 1940, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
  end

  it "shows a page with author information" do

    visit author_path(@author)

    expect(current_page).to eq(@author)
    expect(page).to have_content(@author.name)

    within "#author-book-#{book.id}" do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.number_of_pages)
      expect(page).to have_content(@book_1.publish_year)
      expect(page).to have_css("img[src*='#{@book_1.cover}']")
    end
  end
end

# Each book should show a list of any other authors
# (exclude this show page's author from that list)
