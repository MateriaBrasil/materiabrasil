module PagesHelper
  def item_port_thumbnail(item, name)
    image_tag "portfolio/thumbnails/th_#{item}.jpg", size: "80x80", class: "thumb_image", data: {item: item}
  end
end
