class DatePickerCustomInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    #raise @builder.inspect
    input_html_options[:type] = "text"
    input_html_options[:value] = input_html_options[:value].present? ? input_html_options[:value].strftime("%d/%m/%Y") : ""
    input_html_options[:placeholder] = "dd/mm/yyyy"
    input_html_options[:readonly] = true
    input_html_classes.unshift("form-control")
    template.content_tag(:div, class: "input-group date picker_a_date") do
      @builder.text_field(attribute_name, input_html_options) +
      template.content_tag(:span, class: "input-group-addon calendar-trigger") do
        calendar = template.content_tag(:i,"", class: "fa fa-calendar")
        compulsory = template.content_tag(:sub,"*", class: "",style: "color: red;font-size:30px;padding-left:5px;")
        calendar = calendar + compulsory if input_html_options[:compulsory_fields].present?
        calendar
      end
    end
  end
end
