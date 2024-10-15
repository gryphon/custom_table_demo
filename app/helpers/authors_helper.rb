module AuthorsHelper
  
  def author_icon
    content_tag(:i, "", class: "bi bi-file-text")
  end

  def author_custom_table_fields
    fields = {}
    fields[:name] = { search: { q: :name_cont, type: :text }, appear: :default, link_to_show: true }    
    fields
  end

end
