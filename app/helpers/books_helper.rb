module BooksHelper
  
  def book_icon
    content_tag(:i, "", class: "bi bi-file-text")
  end

  def book_custom_table_fields
    fields = {}
    fields[:name] = { search: { q: :name_cont, type: :text }, appear: :default, link_to_show: true }    
    fields[:genre] = { appear: :default }    
    fields[:released_at] = { search: { q: [:released_at_gteq, :released_at_lteq], type: :dates }, appear: :default, sort: {default_order: :desc} }    
    fields[:status] = { appear: :default, sort: {default_order: :desc}, search: {q: :genre_eq, type: :enum} }    
    fields[:featured] = { search: { q: :featured_eq, type: :boolean }, appear: :default }    
    fields[:pages] = { appear: :default, sort: {default_order: :desc} }    
    fields
  end

end
