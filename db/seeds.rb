BookAuthor.destroy_all
Review.destroy_all
Book.destroy_all
Author.destroy_all

@default_cover = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
@cover_1 = "https://images.penguinrandomhouse.com/cover/9780679645689"
@cover_2 = "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg"
@cover_3 = "https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg"
@cover_4 = "https://images-na.ssl-images-amazon.com/images/I/51vv75oglyL._SX326_BO1,204,203,200_.jpg"
@cover_5 = "https://images-na.ssl-images-amazon.com/images/I/81vjde0JFHL.jpg"
@cover_6 = "https://images-na.ssl-images-amazon.com/images/I/41kUPvqlguL.jpg"
@cover_7 = "https://prodimage.images-bn.com/pimages/9780547928203_p0_v2_s550x406.jpg"
@cover_8 = "https://images-na.ssl-images-amazon.com/images/I/41KGl2FqeAL.jpg"
@cover_9 = "https://images-na.ssl-images-amazon.com/images/I/71IfUpZ8QXL.jpg"
@cover_10 = "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg"
@cover_11 = "https://images-na.ssl-images-amazon.com/images/I/51mug4WQPgL._SX327_BO1,204,203,200_.jpg"
@cover_12 = "https://images-na.ssl-images-amazon.com/images/I/811k9HNhaiL.jpg"
@book_1 = Book.create(title: "In Search Of Lost Time", number_of_pages: 4215, publish_year: 1913, cover: @cover_1)
@book_1.authors.create(name: "Marcel Proust")
@book_2 = Book.create(title: "Don Quixote", number_of_pages: 928, publish_year: 1605, cover: @cover_2)
@book_2.authors.create(name: "Miguel de Cervantes")
@book_3 = Book.create(title: "Ulysses", number_of_pages: 730, publish_year: 1922, cover: @cover_3)
@book_3.authors.create(name: "James Joyce")
@book_4 = Book.create(title: "The Great Gatsby", number_of_pages: 180, publish_year: 1925, cover: @cover_4)
@book_4.authors.create(name: " F. Scott Fitzgerald")
@book_5 = Book.create(title: "Moby Dick", number_of_pages: 752, publish_year: 1851, cover: @cover_5)
@book_5.authors.create(name: "Herman Melville")
@book_6 = Book.create(title: "The Fellowship Of The Ring", number_of_pages: 423, publish_year: 1954, cover: @cover_6)
@book_6.authors.create(name: "J. R. R. Tolkien")
@book_7 = Book.create(title: "The Two Towers", number_of_pages: 352, publish_year: 1954, cover: @cover_7)
@book_7.authors.create(name: "J. R. R. Tolkien")
@book_8 = Book.create(title: "The Return Of The King", number_of_pages: 416, publish_year: 1955, cover: @cover_8)
@book_8.authors.create(name: "J. R. R. Tolkien")
@book_9 = Book.create(title: "The Call Of The Wild", number_of_pages: 232, publish_year: 1903, cover: @cover_9)
@book_9.authors.create(name: "Jack London")
@book_10 = Book.create(title: "The Talisman", number_of_pages: 921, publish_year: 1984, cover: @cover_10)
@book_10.authors.create(name: "Peter Straub, Stephen King")
@book_11 = Book.create(title: "The Art Of Happiness: A Handbook For Living", number_of_pages: 207, publish_year: 1998, cover: @cover_11)
@book_11.authors.create(name: "Dalai Lama, Howard C. Cutler")
@book_12 = Book.create(title: "Into The Wild", number_of_pages: 224, publish_year: 1996, cover: @cover_12)
@book_12.authors.create(name: "Jon Krakauer")
@review_1 = @book_1.reviews.create(title: "Great", rating: 5, review_text: "Read this", username: "Omae")
@review_2 = @book_2.reviews.create(title: "Best Book", rating: 5, review_text: "This was really something", username: "Omae")
@review_3 = @book_3.reviews.create(title: "I just couldn't", rating: 1, review_text: "I had issues with this book", username: "Chickenhawk")
@review_4 = @book_4.reviews.create(title: "Pretty Good So Far", rating: 3, review_text: "I spilled coffee on this and couldn't finish but I liked what I read", username: "Cowsmeow")
@review_5 = @book_5.reviews.create(title: "Wordy", rating: 2, review_text: "Too many words not enough pictures", username: "Friednoodles")
@review_6 = @book_6.reviews.create(title: "I burned it", rating: 2, review_text: "I was reading by candlelight and the book caught fire, so I can only give it two stars", username: "README")
@review_7 = @book_7.reviews.create(title: "Good", rating: 4, review_text: "Fun read for sure!", username: "nyancat")
@review_8 = @book_8.reviews.create(title: "I liked it", rating: 4, review_text: "An entertaining read", username: "nyancat")
@review_9 = @book_9.reviews.create(title: "I recommend this", rating: 4, review_text: "Not gonna lie, I liked it", username: "README")
@review_10 = @book_10.reviews.create(title: "Cool plot", rating: 4, review_text: "Good bokk with interesting characters and story", username: "Userone")
@review_11 = @book_11.reviews.create(title: "Loads of fun", rating: 4, review_text: "Keep this one by your bedside", username: "Userone")
@review_12 = @book_12.reviews.create(title: "I liked it!", rating: 4, review_text: "Cool idea for a book", username: "Omae")
@review_13 = @book_12.reviews.create(title: "Worth it", rating: 4, review_text: "This book was only $5 and it's worth every dollar, which again is $5 so it doesn't get a 5 for a rating because I wouldn't have paid $6 for it but it was still really good", username: "Chickenhawk")
@review_14 = @book_12.reviews.create(title: "Yes please!", rating: 4, review_text: "I hope they write a sequal!", username: "Cowsmeow")
@review_15 = @book_12.reviews.create(title: "Nah", rating: 2, review_text: "Not for me, or people who like good books", username: "Friednoodles")
@review_16 = @book_11.reviews.create(title: "Eh", rating: 3, review_text: "Really so so", username: "README")
@review_17 = @book_11.reviews.create(title: "Evil", rating: 1, review_text: "This book is full of black magic and curses", username: "nyancat")
@review_18 = @book_10.reviews.create(title: "Lost interest", rating: 2, review_text: "I just couldn't get into it", username: "Userone")
@review_19 = @book_9.reviews.create(title: "5 stars", rating: 5, review_text: "Two thumbs up, I mean WAAAAAY up!", username: "Omae")
@review_20 = @book_10.reviews.create(title: "Oh yeah, get into this book!", rating: 5, review_text: "Throw ya nose in here and explore a world beyond your wildest dreams!", username: "Userone")
@review_21 = @book_11.reviews.create(title: "Good for one thing", rating: 1, review_text: "I hated the book but it made a good fire", username: "Userone")
@review_22 = @book_8.reviews.create(title: "I don't know what to think", rating: 3, review_text: "This book asked so many questions and left me with no answers", username: "Omae")
@review_23 = @book_1.reviews.create(title: "What?", rating: 3, review_text: "I can't tell if this book is good or not", username: "Friednoodles")
@review_24 = @book_1.reviews.create(title: "Interesting?", rating: 3, review_text: "I think this book was good but also I don't know so maybe it wasn't?", username: "Cowsmeow")
@review_1 = @book_2.reviews.create(title: "Dang", rating: 2, review_text: "I left my lunch at home. WHOOPS, wrong forum for this.", username: "Chickenhawk")
@review_1 = @book_3.reviews.create(title: "Not bad", rating: 3, review_text: "Also not good. But that might be because I was trying to read it while driving and crashed my car.", username: "Userone")
@review_1 = @book_4.reviews.create(title: "Not my strong suit", rating: 2, review_text: "I'm more the street smart type so this was an experiment that went wrong, but I'm glad for the experience.", username: "Omae")
@review_1 = @book_5.reviews.create(title: "$W337", rating: 5, review_text: "L337 B00K", username: "Chickenhawk")
@review_1 = @book_6.reviews.create(title: "This book.", rating: 5, review_text: " This book changed my life, but only because time passed while I read it so even this review is changing my life. Oof, I need to sit down.", username: "Cowsmeow")
@review_1 = @book_7.reviews.create(title: "OK", rating: 3, review_text: "I SAID IT WAS OKAY WHAT MORE DO YOU WANT FROM ME? Sorry, I didn't realize caps lock was on and I don't feel like retyping all of that.", username: "Friednoodles")
