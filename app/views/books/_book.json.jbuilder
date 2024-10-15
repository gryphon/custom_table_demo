json.extract! book, :id, :name, :genre_id, :released_at, :status, :featured, :pages, :created_at, :updated_at
json.url book_url(book, format: :json)
