ActiveAdmin.register Category do
  menu :label => "Categorias"

  #### TODO: refactoring of the LOOP (I'll use __recursion__ ) children PLEASE #######
  index :as => :block do |category|
    unless category.parent
      div :id => :wrap do
        div :for => category, :class => "category index_category parent_category" do
          h4 auto_link(category.name)
          div do
            ul :class => :categories do
              category.children.each do |s|
                li a("[#{sprintf('%.03d', s.code_reference)}] - #{s.name}", :href => admin_category_path(s)) do
                  ul do
                    s.children.each do |g|
                      li a("[#{sprintf('%.03d', g.code_reference)}] - #{g.name}", :href => admin_category_path(g)) do
                        ul do
                          g.children.each do |p|
                            li a("[#{sprintf('%.03d', p.code_reference)}] - #{p.name}", :href => admin_category_path(p)) do
                              ul do
                                p.children.each do |r|
                                  li a("[#{sprintf('%.03d', r.code_reference)}] - #{r.name}", :href => admin_category_path(r))
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ############## END INDEX (sorry for the END END END L O L) ###############
end

