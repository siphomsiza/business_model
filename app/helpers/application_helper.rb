module ApplicationHelper
  def trasform_alert_key(k)
    return "danger" if k.to_s == "alert"
    return "info" if k.to_s == "notice"
    return k.to_s
  end

  def button_to_function(name, function=nil, html_options={})
    message = "button_to_function is deprecated and will be removed from Rails 4.1. We recommend using Unobtrusive JavaScript instead. " +
      "See http://guides.rubyonrails.org/working_with_javascript_in_rails.html#unobtrusive-javascript"
    ActiveSupport::Deprecation.warn message

    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function};"

    tag(:input, html_options.merge(:type => 'button', :value => name, :onclick => onclick))
  end

  def link(text, path,fa_icon=fa_icon, styleclass='')
    link_to fa_icon(fa_icon, :text => text) , path, :class => "btn btn-default #{styleclass}"
  end

  def list_link(text, path, styleclass='')
    link_to fa_icon('list', :text => text) , path, :class => "btn btn-info #{styleclass}"
  end

  def trash_link(text, path, styleclass='', html_options={})
    link_to fa_icon('trash-o', :text => text), path, :class => "btn btn-danger #{styleclass}", :data => {:confirm => "Are you sure you want to permanently remove this?" }
  end

  def delete_link(text, path, styleclass='')
    link_to fa_icon('trash-o', :text => text), path, :class => "btn btn-danger #{styleclass}"
  end

  def edit_link(text, path, styleclass='')
    link_to fa_icon('pencil', :text => text) , path, :class => "btn btn-default #{styleclass}"
  end


  def new_link(text, path, styleclass='')
    link_to fa_icon('plus', :text => text) , path, :class => "btn btn-default #{styleclass}"
  end

  def show_link(text, path, styleclass='')
    link_to fa_icon('eye', :text => text), path, :class => "btn btn-default  #{styleclass}"
  end

  def search_reset_link(text, path, styleclass='')
    link_to fa_icon('undo', :text => text), path, :class => "btn btn-default  #{styleclass}"
  end


  def html_submit(content=fa_icon('save', :text => "Save"), extra={})
    content_tag "button", content.html_safe,  submit_options(extra)
  end

  def html_search(content=fa_icon('search', :text => "Search"), extra={:class => "btn btn-info"})
    content_tag "button", content.html_safe,  submit_options(extra)
  end


  def html_delete(content=fa_icon('trash-o', :text => "Yes, DELETE THIS ITEM! I know what I am doing!"), extra={"class" => "btn btn-danger"})
    content_tag "button", content.html_safe,  submit_options(extra)
  end

  def submit_options(extra={})
    {"class" => "btn btn-primary ", 'data-disable-with' => "Please wait..."}.merge(extra)
  end

  def back_link(text, path, styleclass='')
    link_to fa_icon('caret-square-o-left', :text => text) , path, :class => "btn btn-default  #{styleclass}"
  end

  def list_search(query, url, *fields) #search_ is reserved by mostly likely ransack
    field_name = "#{fields.join('_or_')}_cont".to_sym
    search_form_for query, :url => url, :html => {:class => 'form-horizontal', :role=>'search'} do |f|
      content_tag(:div, :class=>"input-group") do
        [
          f.text_field(field_name, :class => "form-control",  :placeholder => "search ...", :id => "search"),
          content_tag(:span, :class => 'input-group-btn') do
            html_search + search_reset_link("Reset", url)
          end
        ].join('').html_safe
      end
    end
  end

  def date_format d
    d.strftime("%F") if d
  end

  def year_format d
    d.strftime("%Y") if d
  end

  def datetime_format d
    d.strftime("%F %H:%M") if d
  end

  def format_date(date)
    date ? date.strftime("%d-%m-%Y") : ""
  end

end
