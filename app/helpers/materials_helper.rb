#coding: utf-8
module MaterialsHelper

  def print_row_if_present(val, name)
    if val.present?
      content = ""
      content +=  content_tag(:td, name, class: "faded")
      content +=  content_tag(:td, val)
      content_tag(:tr, content.html_safe)
    end
  end
end



