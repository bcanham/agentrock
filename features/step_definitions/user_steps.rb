Given /"([^\"]*)" is an anonymous user/ do |name|
  visit '/logout'
end

Given /^"([^\"]*)" an unconfirmed user$/ do |name|
  Given "\"#{name}\" is an anonymous user"
  When "I go to the signup form"
  Then "I should see the signup form"
  And "I fill in \"Username\" with \"#{name}\""
  And "I fill in \"Email\" with \"#{name}@example.com\""
  And "I press \"Sign up\""
  Then "I should have a successful signup"
end

Given /^"([^\"]*)" a notified but unconfirmed user$/ do |name|
  Given "\"#{name}\" an unconfirmed user"
  And "I should receive an email"
  When "I open the email"
  Then "I should see \"activate your account\" in the email body"
end

Given /^"([^\"]*)" a confirmed user with password "([^\"]*)"$/ do |name, password|
  Given "\"#{name}\" a notified but unconfirmed user"
  When "I follow \"activate your account\" in the email"
  And "I fill in \"set your password\" with \"#{password}\""
  And "I fill in \"password confirmation\" with \"#{password}\""
  And "I press \"Activate\""
  Then "I should have a successful activation"
  And "a clear email queue"
  When "I follow \"Logout\""
  Then "I should be logged out"
end

Given /^"([^\"]*)" a confirmed user with email "([^\"]*)"$/ do |name, email|
  Given "\"#{name}\" is an anonymous user"
  When "I go to the signup form"
  And "I fill in \"Username\" with \"#{name}\""
  And "I fill in \"email\" with \"#{email}\""
  And "I press \"Sign up\""
  Then "I should receive an email"
  When "I open the email"
  And "I follow \"activate your account\" in the email"
  And "I fill in \"set your password\" with \"secret\""
  And "I fill in \"password confirmation\" with \"secret\""
  And "I press \"Signup\""
  Then "I should have a successful activation"
  And "a clear email queue"
  When "I follow \"Logout\""
  Then "I should be logged out"
end

Then /^I should see the signup form$/ do
  page.should have_content('Username')
  page.should have_content('Email')
  page.should have_content('Password')
  page.should have_content('Password confirmation')  
end

Then /^I should see the activation form$/ do
  page.has_content?('Set your password')
  page.has_content?('Password confirmation')
  page.has_content?('Open ID')
end

Then /^I should have a successful signup$/ do
  Then 'I should see "You have signed up successfully." within "flash_notice"'
end

Then /^I should have an unsuccessful signup$/ do
  Then 'I should not see "You have signed up successfully"'
end

Then /^I should have a successful activation$/ do
  Then "I should see my account editing page"
  And 'I should see "Your account has been activated"'
end

Then /^I should have an unsuccessful activation$/ do
  Then 'I should not see "Your account has been activated"'
end

Then /^I should be logged in$/ do
  Then 'I should see "My Account"'
end

Then /^I should not be logged in$/ do
  Then 'I should not see "My Account"'
end

Then /^I should be logged out$/ do
  Then 'I should not be logged in'
  And 'I should see "Logout successful!"'
end

Then /^I should see the home page$/ do
  Then 'I should see "Home"'
end

Then /^I should see my account page$/ do
  Then 'I should be on "the account page"'
  And 'I should see "User Account"'
end

Then /^I should not see my account page$/ do
  Then 'I should not see "User Account"'
end

Then /^I should see my account editing page$/ do
  Then 'I should be on "the account editing page"'
  And 'I should see "Editing user"'
end


# Given /^the following registers:$/ do |registers|
#   Register.create!(registers.hashes)
# end
# 
# When /^I delete the (\d+)(?:st|nd|rd|th) register$/ do |pos|
#   visit registers_path
#   within("table tr:nth-child(#{pos.to_i+1})") do
#     click_link "Destroy"
#   end
# end
# 
# Then /^I should see the following registers:$/ do |expected_registers_table|
#   expected_registers_table.diff!(tableish('table tr', 'td,th'))
# end

# Given /^"([^\"]*)" is an anonymous user$/ do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should see the registration form$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should have a successful registration$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should have an unsuccessful registration$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Given /^"([^\"]*)" an unconfirmed user$/ do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
# 
# Given /^I should receive an email$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# When /^I open the email$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should see "([^\"]*)" in the email body$/ do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
# 
# Given /^"([^\"]*)" a notified but unconfirmed user$/ do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
# 
# When /^I follow "([^\"]*)" in the email$/ do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should see the activation form$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should see the home page$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should have a successful activation$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should be logged in$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should be logged out$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should have an unsuccessful activation$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should have 2 emails at all$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# When /^I open the most recent email$/ do
#   pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I should see "([^\"]*)" in the email subject$/ do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
