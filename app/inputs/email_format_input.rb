class EmailFormatInput < SimpleForm::Inputs::Base
  def input
    input_html_options[:type] ||= 'text' if html5?
    input_html_options[:value] = @builder.object.send(attribute_name).to_s# breaks validations if delimeter is put to anythign else
    input_html_options[:placeholder] = "Format: yourname@yoursite.com"
    input_html_classes.unshift("form-control")
    template.content_tag(:div, class: "input-group") do
      @builder.text_field(attribute_name, input_html_options) +
      template.content_tag(:span,"@", class: "input-group-addon")
    end
  end
end
