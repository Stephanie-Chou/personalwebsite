class Article < ActiveRecord::Base
  has_many :article_tags
  has_many :tags, :through => :article_tags

  def tag(input)
    tags = input.split(',')
    tags.each do |tag|
      new_tag = Tag.find_or_create_by(name:tag)
      ArticleTag.find_or_create_by(tag:new_tag, article: self)
    end
  end
end
