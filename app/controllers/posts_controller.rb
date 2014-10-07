require 'pry'
class PostsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def show
		@articles = Article.all
	end

	def create

	end

	def edit
		@article = Article.find(params[:id])

	end

	def update
		p params
		@article = Article.find(params[:id])
		@article.update(post_params)
		@article.save 

		redirect_to blog_path
	end

	def destroy
	end
  private

  def post_params
    params.require(:post).permit(:date, :title, :problem, :language, :runtime, :content, :code)
  end
end
