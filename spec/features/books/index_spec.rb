require "rails_helper"

RSpec.describe "user_index", type: :feature do
  before :each do
    @book_1 = Book.create(title: "In Search Of Lost Time", number_of_pages: 4215, publish_year: 1913, cover: "https://images.penguinrandomhouse.com/cover/9780679645689")
    @author_1 = @book_1.authors.create(name: "Marcel Proust")
    @book_2 = Book.create(title: "Don Quixote", number_of_pages: 928, publish_year: 1605, cover: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
    @author_2 = @book_2.authors.create(name: "Miguel de Cervantes")
    @book_3 = Book.create(title: "Ulysses", number_of_pages: 730, publish_year: 1922, cover: "https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg")
    @author_3 = @book_3.authors.create(name: "James Joyce")
    @book_4 = Book.create(title: "The Talisman", number_of_pages: 921, publish_year: 1984, cover: "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg")
    @author_4 = @book_4.authors.create(name: "Peter Straub, Stephen King")
  end
  it "user_can_see_all_books" do

    visit "/books"

    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_1.number_of_pages)
    expect(page).to have_content(@book_1.authors.name)
    expect(page).to have_content(@book_1.publish_year)
    expect(page).to have_content(@book_1.cover)
    expect(page).to have_content(@book_4.authors.name)
  end
end
