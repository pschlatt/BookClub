require "rails_helper"

RSpec.describe "user_index", type: :feature do
  it "user_can_see_all_books" do
    book_1 = Book.create(title: "Catcher In the Rye", number_of_pages: 303, publish_year:1965)
    book_2 = Book.create(title: "1984", number_of_pages: 400, publish_year:1948)

    visit "/books"

    expect(page).to have_content(book_1.title)
    expect(page).to have_content("#{book_1.number_of_pages}")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content("#{book_2.number_of_pages}")
  end
end
