# https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Cucumber

Given /^the following user accounts$/ do |table|
  table.hashes.each do |hash|
    User.new(:email => hash[:email],
               :password => hash[:password],
               :password_confirmation => hash[:password]).save!
  end
end

Given /^I am not logged in$/ do
  visit('/users/sign_out')
end

Given /^I am logged in$/ do
  email = 'testing@man.net'
  password = 'secretpass'

  Given %{I am not logged in}
  And %{I have one user "#{email}" with password "#{password}"}
  And %{I follow "Sign in"}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I have one user "([^"]*)" with password "([^"]*)"$/ do |email, password|
  User.new(:email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am logged in as the following user$/ do |table|
  email = table.hashes.first[:email]
  password = table.hashes.first[:password]
  Given %{I am not logged in}
  And %{I have one user "#{email}" with password "#{password}"}
  And %{I follow "Sign in"}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end


