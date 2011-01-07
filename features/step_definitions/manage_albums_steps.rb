Given /^I am logged in and have the artist "([^"]*)"$/ do |artist|
  email = 'testing@man.net'
  password = 'secretpass'
  user = User.new(:email => email,
           :password => password,
           :password_confirmation => password)
  user.save
  a = user.artists.new(:name => artist)
  a.save
  
  Given %{I am not logged in}
  And %{I follow "Sign in"}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end
