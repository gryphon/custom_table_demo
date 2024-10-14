<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
  <%- attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %><%= ', required: true' if attribute.required? %>
  <%- end -%>
  <%- attributes.select(&:token?).each do |attribute| -%>
  has_secure_token<% if attribute.name != "token" %> :<%= attribute.name %><% end %>
  <%- end -%>
  <%- if attributes.any?(&:password_digest?) -%>
  has_secure_password
  <%- end -%>

  def self.ransackable_attributes(auth_object = nil)
    [<%= attributes.collect{|a| "\"#{a.name}\""}.join(", ") %>]
  end

  def self.ransackable_scopes(auth_object = nil)
    []
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
<% end -%>