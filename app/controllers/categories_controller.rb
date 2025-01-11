class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories.as_json(only: [:id, :name, :description, :image_url])
  end
end
