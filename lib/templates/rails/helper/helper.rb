<% module_namespacing do -%>
module <%= class_name %>Helper
  
  def <%= singular_table_name %>_icon
    content_tag(:i, "", class: "bi bi-file-text")
  end

<% if self&.shell&.base&.respond_to?(:attributes) -%>
  def <%= singular_table_name %>_custom_table_fields
    fields = {}
    <%- self&.shell&.base&.attributes.each_with_index do |attribute, i| -%>
    <%- if [:integer, :float, :decimal].include? attribute.type -%>
    fields[:<%= attribute.name %>] = { appear: :default, sort: {default_order: :desc}<%= i==0 ? ", link_to_show: true" : "" %> }    
    <%- elsif attribute.reference? -%>
    fields[:<%= attribute.name %>] = { appear: :default<%= i==0 ? ", link_to_show: true" : "" %> }    
    <%- elsif [:string, :text].include? attribute.type -%>
    fields[:<%= attribute.name %>] = { search: { q: :<%= attribute.name %>_cont, type: :text }, appear: :default<%= i==0 ? ", link_to_show: true" : "" %> }    
    <%- elsif attribute.type == :boolean -%>
    fields[:<%= attribute.name %>] = { search: { q: :<%= attribute.name %>_eq, type: :boolean }, appear: :default<%= i==0 ? ", link_to_show: true" : "" %> }    
    <%- elsif attribute.type == :date -%>
    fields[:<%= attribute.name %>] = { search: { q: [:<%= attribute.name %>_gteq, :<%= attribute.name %>_lteq], type: :dates }, appear: :default, sort: {default_order: :desc}<%= i==0 ? ", link_to_show: true" : "" %> }    
    <%- end -%>
    <%- end -%>
    fields
  end
<% end -%>

end
<% end -%>