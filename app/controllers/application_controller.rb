class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  def blog
    if params[:tag].nil?
    	@articles = Article.order('created_at').reverse
    else
      p params[:tag]
      @articles = Tag.find(params[:tag]).articles.order('created_at')
    end
  end

  def about
  end

  def error
  end
end
