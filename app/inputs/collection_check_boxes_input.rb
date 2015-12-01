#EXample
#radio buttons with a column width override for the 'right_column' wrapper
# = simple_form_for(user, wrapper: :bootstrap3_horizontal, defaults: {right_column_html: {class: "col-lg-3 col-md-3"},
#   label_html: {class: "col-lg-2 col-md-2"} }, html: {class: "form-horizontal", role: "form"}) do |f|
#   = f.input :email
#   = f.association :roles, as: :check_boxes, right_column_html: { class: "col-lg-10 col-md-10" }


#app/inputs/collection_check_boxes_input.rb
class CollectionCheckBoxesInput < SimpleForm::Inputs::CollectionCheckBoxesInput
  def item_wrapper_class
    "checkbox-inline"
  end
end