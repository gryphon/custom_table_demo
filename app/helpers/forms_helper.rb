module FormsHelper
  def horizontal_form_for(record, options = {}, &block)
    options[:wrapper] = options[:wrapper] || :horizontal_form
    options[:wrapper_mappings] = {
      boolean: :horizontal_boolean,
      check_boxes: :horizontal_collection,
      date: :horizontal_multi_select,
      datetime: :horizontal_multi_select,
      file: :horizontal_file,
      radio_buttons: :horizontal_collection,
      range: :horizontal_range,
      time: :horizontal_multi_select,
      select: :horizontal_select
    }

    simple_form_for(record, options, &block)
  end

  def inline_form_for(record, options = {}, &block)

    options[:html] = { class: "g-3 align-items-center search-fields-filter" }
    options[:wrapper] = options[:wrapper] || :inline_form

    options[:wrapper_mappings] = {
      boolean: :inline_boolean,
      check_boxes: :vertical_collection,
      radio_buttons: :vertical_collection,
      date: :inline_element,
      select: :inline_select
    }
    simple_form_for(record, options, &block)
  end


  def vertical_form_for(record, options = {}, &block)
    options[:html] = { class: "form-vertical" }
    options[:wrapper] = options[:wrapper] || :vertical_form
    options[:wrapper_mappings] = {
      boolean: :vertical_boolean,
      check_boxes: :vertical_collection,
      radio_buttons: :vertical_collection
    }
    simple_form_for(record, options, &block)
  end

  def floating_form_for(record, options = {}, &block)

    return editable_form_for(record, options, &block) if (params[:editable])

    options[:wrapper] = options[:wrapper] || :floating_labels_form
    options[:wrapper_mappings] = {
      select: :floating_labels_select
    }
    simple_form_for(record, options, &block)
  end

  def editable_form_for(record, options = {}, &block)

    # SimpleForm.setup do |config|
    #   config.wrappers :editable_form, class: 'col-12' do |b|
    #     b.use :html5
    #     b.use :placeholder
    #     b.optional :maxlength
    #     b.optional :minlength
    #     b.optional :pattern
    #     b.optional :min_max
    #     b.optional :readonly
    #     b.use :label, class: 'visually-hidden'
    
    #     b.use :input, class: 'form-control', error_class: 'is-invalid'#, valid_class: 'is-valid'
    #     b.use :error, wrap_with: { class: 'invalid-feedback' }
    #     b.optional :hint, wrap_with: { class: 'form-text' }
    #   end
    
    # end

    # options[:html] = { class: "form-vertical" }
    # options[:wrapper] = options[:wrapper] || :editable_form
    # options[:wrapper_mappings] = {
    #   boolean: :vertical_boolean,
    #   check_boxes: :vertical_collection,
    #   radio_buttons: :vertical_collection
    # }
    inline_form_for(record, options, &block)
  end


end
