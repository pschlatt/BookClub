require 'rails_helper'

RSpec.describe 'book show page', type: :feature do
  before :each do
    @book_1 = Book.create(title: "In Search Of Lost Time", number_of_pages: 4215, publish_year: 1913, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
    @author_1 = @book_1.authors.create(name: "Marcel Proust")
    @review_1 = @book_1.reviews.create(title: "Great", rating: 5, review_text: "Read this", username: "Omae")
    @review_2 = @book_1.reviews.create(title: "What?", rating: 3, review_text: "I can't tell if this book is good or not", username: "Friednoodles")
    @review_3 = @book_1.reviews.create(title: "Interesting?", rating: 3, review_text: "I think this book was good but also I don't know so maybe it wasn't?", username: "Cowsmeow")
    @book_4 = Book.create(title: "The Talisman", number_of_pages: 921, publish_year: 1984, cover: "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg")
    @author_4 = @book_4.authors.create(name: "Peter Straub, Stephen King")
    @review_4 = @book_4.reviews.create(title: "Pretty Good So Far", rating: 3, review_text: "I spilled coffee on this and couldn't finish but I liked what I read", username: "Cowsmeow")
  end

  it 'user can see all info for one book' do

    visit book_path(@book_1)

    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_1.number_of_pages)
    expect(page).to have_content(@book_1.authors.first.name)
    expect(page).to have_content(@book_1.publish_year)
    expect(page).to have_css("img[src*='#{@book_1.cover}']")
    expect(page).to_not have_content(@book_4.authors.first.name)
  end

  it 'user can see reviews for one book' do

    visit book_path(@book_1)

    expect(page).to have_content(@review_1.title)
    expect(page).to have_content(@review_2.username)
    expect(page).to have_content(@review_3.rating)
    expect(page).to have_content(@review_1.review_text)
  end
end
