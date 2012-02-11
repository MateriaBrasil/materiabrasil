module PagesHelper
  def iframe_helper_tag(options = {})
    "<iframe src=\"#{options[:src]}\" width=\"#{options[:width]}\" height=\"#{options[:height]}\"></iframe>"
  end
end
