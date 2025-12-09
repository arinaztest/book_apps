json.extract! book, :id, :title, :published_year, :author_id, :publisher_id, :created_at, :updated_at
json.url book_url(book, format: :json)
