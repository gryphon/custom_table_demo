module GenresHelper
  
  def genre_icon
    content_tag(:i, "", class: "bi bi-file-text")
  end

  def genre_custom_table_fields
    fields = {}
    fields[:name] = { search: { q: :name_cont, type: :text }, appear: :always, link_to_show: true }    
    fields[:books_count] = { appear: :default }    
    fields[:parent] = { appear: :default }    
    fields
  end

  def genre_books_count genre
    return genre.books.count if !genre.parent.nil?
    return Book.where(genre: genre.children).count
  end

end
