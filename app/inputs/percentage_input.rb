class PercentageInput < SimpleForm::Inputs::Base
  include ActionView::Helpers::NumberHelper
  def input
    input_html_classes.unshift("decimal")
    input_html_options[:type] ||= 'text' if html5?

    input_html_options[:value] = number_with_precision((@builder.object.send(attribute_name) rescue 0).to_f, :separator => '.', :delimiter => '', :precision => 2)# breaks validations if delimeter is put to anythign else

    input_html_classes.unshift("form-control numeric")
    template.content_tag(:div, class: "input-group") do 
      @builder.text_field(attribute_name, input_html_options) +
      template.content_tag(:span, "%", class: "input-group-addon") 
    end
  end
end