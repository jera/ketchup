
Given /^the existence of "([^"]*)" user$/ do |username|
  User.create :username => username, :email => "#{username}@jera.com.br", 
    :password => username.reverse, :password_confirmation => username.reverse
end
