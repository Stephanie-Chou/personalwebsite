require "rails_helper"

RSpec.describe Article, :type => :model do
  it "adds an existing tag to the article" do
    article = FactoryGirl.create(:article)
    tag = FactoryGirl.create(:tag)

    article.tag("test")

    expect(ArticleTag.last.article_id).to eq(article.id)
    expect(ArticleTag.last.tag_id).to eq(tag.id)
  end

  it "adds a new tag to the article" do
    article = FactoryGirl.create(:article)
    article.tag("banana")
    expect(Tag.find(ArticleTag.last.tag_id).name).to eq("banana")
  end
end