class DateTimePickerInput  < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:type] = "text"
    date_and_time = '%d/%m/%Y %H:%M'
    input_html_options[:value] = @builder.object.send(attribute_name).present? ? @builder.object.send(attribute_name).strftime("%d/%m/%Y %H:%M") : DateTime.strptime(input_html_options[:value].to_s,date_and_time).strftime("%d/%m/%Y %H:%M") rescue ""
    input_html_options[:placeholder] = "dd/mm/yyyy hh:mm"

    input_html_classes.unshift("form-control")
    template.content_tag(:div, class: "input-group date picker_a_date_time") do
      @builder.text_field(attribute_name, input_html_options) +
      template.content_tag(:span, class: "input-group-addon") do
        template.content_tag(:span,'',class: "glyphicon glyphicon-calendar")
      end
    end
  end
end
