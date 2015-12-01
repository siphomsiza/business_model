class FieldForTextInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:type] = "text"
    input_html_classes.unshift("form-control")
    @builder.text_field(attribute_name, input_html_options)
  end
end
