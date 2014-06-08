#coding: utf-8
module ApplicationHelper

  def load_block(options = {})
    block = options[:block] || rand(4) + 1
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
          break if material[counter] == nil
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

  def load_indicators(obj)
    kinds     = {}
    content   = ""
    children  = ""
    kinds = {
      "Ciclo"         => "cycle",
      "Segurança"     => "security",
      "Humano-social" => "human",
      "Energia"       => "energy",
      "Água"          => "water",
      "Gestão"        => "management"
    }
    categories  ||=  obj.categories

    kinds.each_with_index do |k,v|

      flag     =  categories.map(&:name).include?(k.first) ? true : false
      if flag
        children =
          content_tag(:ul, class: "children #{k.second}", data: {type: k.second}) do
            Category.find_by_name(k.first).children.reduce('') do |c, m|
              if ['Uso', 'Fonte', 'Produção'].include?(m.name)
                @temp = ''
                Category.find(m.id).children.each do |child|
                  @temp += content_tag(:li, child.name, class: categories.map(&:id).include?(child.id) ? "active" : "inactive")
                end
                c.html_safe << @temp.html_safe
              else
                c.html_safe << content_tag(:li, m.name, class: categories.map(&:id).include?(m.id) ? "active" : "inactive")
              end
            end
        end
      end
      
      content +=  content_tag(:li, class: "indicator #{k.second} #{ flag ? "" : "inactive"}", data: {type: k.second}, title: k.first) do
        content_tag(:div, class: "indicator-title") do
          image_tag(asset_path("site/indicators/#{k.second}.png"), data: { type: k.second } ) + "\n" + content_tag(:span, (k.first == 'Humano-social' ? 'Humano' : k.first) )
        end + "\n" + children.html_safe
      end + "\n"

    end
    content_tag(:ol, class: "list") do
      content.html_safe
    end
  end
end



