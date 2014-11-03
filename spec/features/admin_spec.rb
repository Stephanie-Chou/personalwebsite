require "spec_helper"

feature "admin posts view" do
  background do
    User.create(:email => 'user@example.com', :password => '1234')
    visit admin_path
    fill_in "email", :with => "user@example.com"
    fill_in "password", :with => "1234"
    click_button "Log In"
    # page.driver.browser.authorize 'user', '1234'
  end

  context "on Posts page" do
    it "can see posts" do
      Article.create(title: "Test", content:"test content")
      visit blog_path
      expect(page).to have_content("test content")
    end

    it "can see edit button on posts" do
      Article.create(title: "Test", content:"test content")
      visit blog_path
      expect(page).to have_content("Edit")
    end

    it "can see new post button" do
      visit blog_path
      expect(page).to have_content("New Post")
    end

    it "can visit edit page by clicking on edit button" do
      Article.create(title: "Test", content:"test content")
      visit blog_path
      expect(page).to have_content("test content")
    end

    it "can click on a new post button" do
      visit blog_path
      click_link('New Post')
      expect(page).to have_content("Post")
    end

  end

  context "on edit posts page" do
    it "can edit a post" do
      Article.create(title: "Test", content:"test content")
      visit blog_path
      click_link('Edit')
      fill_in 'title', with: 'changed test title'

      click_button('edit')
      expect(page).to have_content('changed test title')
    end
  end

  context "on new posts page" do
    it "can create a new post" do
      visit new_post_url
      expect {
         fill_in 'title',   with: "Hello world!"
         fill_in 'content', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         click_button "Post"
       }.to change(Article, :count).by(1)
       expect(page).to have_content("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.")
    end
  end

end