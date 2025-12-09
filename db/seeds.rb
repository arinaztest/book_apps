# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Создание авторов
authors = [
  { name: 'Leo Tolstoy' },
  { name: 'Fyodor Dostoevsky' },
  { name: 'Anton Chekhov' }
]

authors.each do |author_attributes|
  Author.find_or_create_by(name: author_attributes[:name])
end

# Создание издателей
publishers = [
  { name: 'Penguin Classics' },
  { name: 'Vintage' },
  { name: 'Oxford Press' }
]

publishers.each do |publisher_attributes|
  Publisher.find_or_create_by(name: publisher_attributes[:name])
end

# Создание книг
books = [
  { title: 'War and Peace', author_name: 'Leo Tolstoy', publisher_name: 'Penguin Classics', published_year: 1869 },
  { title: 'Anna Karenina', author_name: 'Leo Tolstoy', publisher_name: 'Vintage', published_year: 1877 },
  { title: 'Crime and Punishment', author_name: 'Fyodor Dostoevsky', publisher_name: 'Vintage', published_year: 1866 },
  { title: 'The Brothers Karamazov', author_name: 'Fyodor Dostoevsky', publisher_name: 'Oxford Press', published_year: 1880 },
  { title: 'The Cherry Orchard', author_name: 'Anton Chekhov', publisher_name: 'Oxford Press', published_year: 1904 }
]

books.each do |book_attributes|
  author = Author.find_or_create_by(name: book_attributes[:author_name])
  publisher = Publisher.find_or_create_by(name: book_attributes[:publisher_name])
  
  Book.find_or_create_by(title: book_attributes[:title]) do |book|
    book.author = author
    book.publisher = publisher
    book.published_year = book_attributes[:published_year]
  end
end

# Создание жанров
genres = [
  { name: 'Novel' },
  { name: 'Philosophy' },
  { name: 'Drama' }
]

genres.each do |genre_attributes|
  Genre.find_or_create_by(name: genre_attributes[:name])
end

# Привязка жанров к книгам
book_genres = [
  { book_title: 'War and Peace', genre_name: 'Novel' },
  { book_title: 'Anna Karenina', genre_name: 'Novel' },
  { book_title: 'Crime and Punishment', genre_name: 'Novel' },
  { book_title: 'Crime and Punishment', genre_name: 'Philosophy' },
  { book_title: 'The Brothers Karamazov', genre_name: 'Novel' },
  { book_title: 'The Brothers Karamazov', genre_name: 'Philosophy' },
  { book_title: 'The Cherry Orchard', genre_name: 'Drama' }
]

book_genres.each do |bg_attributes|
  book = Book.find_by(title: bg_attributes[:book_title])
  genre = Genre.find_by(name: bg_attributes[:genre_name])
  
  BookGenre.find_or_create_by(book: book, genre: genre)
end
