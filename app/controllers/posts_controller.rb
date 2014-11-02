require 'pry'
class PostsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def show
		@articles = Article.order('created_at')
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(post_params)
		@article.tag(params[:tags])
		redirect_to blog_path
	end

	def edit
		@article = Article.find(params[:id])
		@tags = @article.tags.pluck('name').join(',')
	end

	def update
		@article = Article.find(params[:id])
		@article.update(post_params)
		@article.save
		@article.tag(params[:tags])
		redirect_to blog_path
	end

	def destroy
	end

  private

  def post_params
    params.require(:post).permit(:date, :title, :problem, :language, :runtime, :content, :code)
  end
end
