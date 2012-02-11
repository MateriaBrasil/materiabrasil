ActiveAdmin.register Category do


  #### TODO: refactoring of the LOOP (I'll use __recursion__ ) children PLEASE #######
  index :as => :block do |category|
    unless category.parent
      div :id => :wrap do
        div :for => category, :class => "category index_category" do
          h4 auto_link(category.name)
          div do
            ul :class => :categories do
              category.children.each do |s|
                li a(s.name, :href => admin_category_path(s)) do
                  ul do
                    s.children.each do |g|
                      li a(g.name, :href => admin_category_path(g)) do
                        ul do
                          g.children.each do |p|
                            li a(p.name, :href => admin_category_path(p)) do
                              ul do
                                p.children.each do |r|
                                  li a(r.name, :href => admin_category_path(r)) do
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
  end
  ############## END INDEX (sorry for the END END END L O L) ###############
end

