class CurrencyInput < SimpleForm::Inputs::Base
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper
  def input(wrapper_options)
    input_html_classes.unshift("decimal")
    input_html_options[:type] ||= 'text' if html5?
    input_html_options[:value] = number_with_precision((@builder.object.send(attribute_name) rescue 0).to_f, :separator => '.', :delimiter => ',', :precision => 2)# breaks validations if delimeter is put to anythign else
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    input_html_classes.unshift("form-control numeric")
    template.content_tag(:div,template.content_tag(:span, currency_unit, class: "input-group-addon") +
      @builder.text_field(attribute_name, input_html_options),class: "input-group"
    )
  end
end
