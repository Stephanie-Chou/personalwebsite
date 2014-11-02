require "rails_helper"

RSpec.describe PostsController, :type => :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "creates a new article" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "POST #create" do
    it "creates an article" do
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      article = Article.create!

      get :edit, {id: article.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the edit template" do
      article = Article.create!
      get :edit, {id: article.id}
      expect(response).to render_template("edit")
    end

    it "tags related to article" do
      article1, article2 = Article.create!, Article.create!
      tag = Tag.create!(name: "test")
      articletag = ArticleTag.create(article: article1, tag: tag)
      get :edit, {id: article1.id}

      expect(assigns(:tags)).to eq(tag.name)
    end
  end
end