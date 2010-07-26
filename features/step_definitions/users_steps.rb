
# TODO Rever uma forma de fazer isso usando o método sign_in do helper do devise
Given /^I am signed in with "([^"]*)" user$/ do |username|
  @user = User.find_by_username(username)
    visit("/users/sign_in")
    fill_in("username", :with => @user.username)
    fill_in("password", :with => 'secret')
    click_button("Sign in")    
end