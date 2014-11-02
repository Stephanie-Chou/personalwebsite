require 'pry'
class PostsController < ApplicationController
	include Admin::DashboardHelper
	skip_before_filter  :verify_authenticity_token
	before_action :verify_admin, only: [:new, :edit, :update, :create]
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


  def verify_admin
  	unless signed_in?
  		redirect_to error_path
  	end
  end
end
