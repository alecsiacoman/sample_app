require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
 
  #we want to verify if the site is working
  test "layout links" do
    #get the root path(it should go to home page)
    get root_path
    #verify that the right page template is rendered
    assert_template 'static_pages/home'
    #check for correct links: Home, Help, About, Contact
    #test the presence of a particular link
    assert_select "a[href=?]", root_path, count: 2 #for the root path(home) there are 2 links, including the logo
    assert_select "a[href=?]", help_path #the help_path is instantly replacing the '?'
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

  end

end
