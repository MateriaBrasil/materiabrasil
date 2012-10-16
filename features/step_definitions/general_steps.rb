# Categories
Given /^I visit the "([^"]*)"$/ do |arg1|
  visit eval(arg1)
end

Given /^I'm in the home page$/ do
  visit root_path
end

When /^I visit the "([^"]*)" category path$/ do |arg1|
  category = Category.find_by_name(arg1)
  visit category_path(category)
end

Then /^I should be in "([^"]*)" material path$/ do |arg1|
  material = Material.find_or_create_by_name(arg1)
  page.current_path.should == material_path(material)
end

Given /^a category called "([^"]*)" exists$/ do |arg1|
  Category.make!(name: arg1)
end


Given /^a children category of "([^"]*)" called "([^"]*)" exists$/ do |arg1, arg2|
  parent = Category.find_by_name(arg1)
  Category.make!(name: arg2, parent: parent)
end

# Materials
Given /^a material named "([^"]*)" with category "([^"]*)", "([^"]*)", "([^"]*)" exists$/ do |arg1, arg2, arg3, arg4|
  material = Material.make!(name: arg1)
  material.categories = Category.find(:all, conditions: ['name IN (?, ?, ?)', arg2, arg3, arg4])
end

Then /^I should see the "([^"]*)" ([^"]*)/ do |arg1, arg2|
  material = Material.find_by_name(arg1)
  case arg2
    when "image" then page.should have_xpath("//img[@alt='#{material.name}']")
    when "name" then page.should have_content(material.name)
    when "resume" then page.should have_content(material.resume)
  end
end

When /^I click on the link "([^"]*)"$/ do |arg1|
  click_link(arg1) 
end


When /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  page.execute_script("$('form#search .field').attr('value',#{arg2});")
end

When /^I submit the search form$/ do
  page.execute_script("$('form#search .field').submit();")
end
