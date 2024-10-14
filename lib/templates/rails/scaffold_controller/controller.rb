<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController

  load_and_authorize_resource :<%= singular_table_name %>

  # TIP: Remove show action from router and you will get editing form inline automatically

  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = custom_table(@<%= plural_table_name %>)
  end

  # GET <%= route_url %>/1
  def show
  end

  # GET <%= route_url %>/new
  def new
  end

  # GET <%= route_url %>/1/edit
  def edit
  end

  # POST <%= route_url %>
  def create
    if @<%= orm_instance.save %>
      redirect_to defined?(:<%= singular_table_name %>_path) ? @<%= singular_table_name %> : <%= redirect_resource_name %>, notice: t("notices.successfully_created")
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to defined?(:<%= singular_table_name %>_path) ? @<%= singular_table_name %> : <%= redirect_resource_name %>, notice: turbo_frame_request? ? nil : t("notices.successfully_updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance.destroy %>
    redirect_to <%= index_helper %>_url, notice: t("notices.successfully_destroyed")
  end

  private

    # Only allow a list of trusted parameters through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params.fetch(:<%= singular_table_name %>, {})
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= permitted_params %>)
      <%- end -%>
    end
    
end
<% end -%>