Given /^I'm an admin and I'm logged In$/ do
  visit '/admin/login'

  AdminUser.make!(:email => "test@test.com", :password => "test123")
  fill_in "Email", :with => "test@test.com"
  fill_in "Password", :with => "test123"
  click_button "Login"
end


Given /^(\d+) ([^"]*) exists$/ do |arg1, arg2|
  if arg2.to_s == "category"
    @c = Category.make!
    arg1.to_i.times do |c|
      @d = Category.make!(:parent_id => @c.id)
    end
  elsif arg2.to_s == "manufacturer"
    arg1.to_i.times do |c|
      Manufacturer.make!
    end
  end
end


Given /^I chose 1 ([^"]*)$/ do |arg1|
  if arg1.to_s == "category"
    check(@d.name)
  elsif arg1.to_s == "manufacturer"
    page.execute_script("$('select#material_manufacturer_id > option:last-child').attr('selected','selected');")
  end
end

Given /^I fill "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  fill_in arg1, :with => arg2
end

Given /^I click "([^"]*)"$/ do |arg1|
 click_on arg1
end

Given /^I check "([^"]*)"$/ do |arg1|
  check(arg1)
end

Then /^I should be in "([^"]*)"$/ do |arg1|
  current_path.should == eval(arg1)
end

Then /^I should see "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
end
