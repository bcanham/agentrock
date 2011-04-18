Given /^I am not authenticated$/ do
  visit('/logout') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |name, email, password|
  User.new(:name => name,
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

# 
# 
# Given /^that I am not a user$/ do
# 
# end
# 
# When /^I got to the signup page$/ do
#   
# end
# 
# Then /^I should have a successful signup$/ do
#   Then 'I should see "Thank you for signing up! You are now logged in."'
# end