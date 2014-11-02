require "rails_helper"

RSpec.describe ApplicationController, :type => :controller do
  describe "GET #blog" do
    it "responds successfully with an HTTP 200 status code" do
      get :blog
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the blog template" do
      get :blog
      expect(response).to render_template("blog")
    end

    it "loads all of the articles into @articles on a normal load with no params" do
      article1, article2 = Article.create!, Article.create!
      get :blog

      expect(assigns(:articles)).to match_array([article1, article2])
    end

    it "loads all of the articles into @articles with a certain tag if passed a tag parameter" do
      article1, article2 = Article.create!, Article.create!
      tag = Tag.create!(name: "test")
      articletag = ArticleTag.create(article: article1, tag: tag)
      get :blog, {tag: tag.id}

      expect(assigns(:articles)).to match_array([article1])
    end
  end
end