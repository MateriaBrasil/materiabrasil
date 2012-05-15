module ApplicationHelper

  def load_block(options = {})
    block = options[:block] || rand(1..5)
    material = options[:materials]
    blocks = {
      1 => [ 
       ["tall", "threecol tall"], 
       ["flat", "threecol flat"], 
       ["longflat", "sixcol last flat"],       
       ["longflat", "sixcol flat"],
       ["flat", "threecol flat last"]
      ],
      2 => [ 
       ["largetall", "fivecol tall"], 
       ["main", "sevencol tall last"]
      ],
      3 => [
       ["tall", "threecol tall"],       
       ["tall", "threecol tall"],
       ["longflat", "sixcol last flat"],
       ["flat", "threecol flat"], 
       ["flat", "threecol flat last"], 
      ],
      4 => [ 
       ["main", "sixcol tall"],       
       ["main", "sixcol last tall"]
      ],
      5 => [
       ["flat", "threecol flat"], 
       ["longflat", "sixcol flat"], 
       ["tall", "threecol tall last special"],       
       ["flat", "threecol flat"],
       ["longflat", "sixcol flat"]
      ],
    }

    content_tag :ol, class: "materials block_#{block}" do
      counter = 0
      content = ""
      blocks[block].each do |k, v|
        break if material[counter].nil? 
        content += content_tag :li, class: "material #{v}" do
          content_tag(:div, class: "image") do
            link_to image_tag(material[counter].images.first.image.send("#{k}"), title: material[counter].name), material_path(material[counter])
          end +
          content_tag(:div, class: "name") do
            link_to material[counter].name, material_path(material[counter])
          end
        end
        counter = counter + 1
      end
      content.html_safe
    end
  end
end
