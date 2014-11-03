require "spec_helper"

feature "admin posts view" do
  before(:each) do
    page.driver.browser.authorize 'user', '1234'
  end

  context "on Posts page" do
    it "can see posts" do
      Article.create(title: "Test", content:"test content")
      visit blog_path
      click_link('Edit')
      expect(page).to have_content("test content")
    end

    it "can see edit button on posts" do
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
      click_link('Edit')
      expect(page).to have_content("test content")
    end

    it "can click on a new post button" do
      visit blog_path
      click_link('New Post')
      expect(page).to have_content("Create")
    end

  end

  context "on edit posts page" do
    it "can edit a post" do
    end
  end

  context "on new posts page" do
    it "can create a new post" do
    end
  end

end