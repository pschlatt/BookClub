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
  end

  it "shows a page with author information" do

    visit author_path(@author_1)
# save_and_open_page
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
end

# Each book should show a list of any other authors
# (exclude this show page's author from that list)