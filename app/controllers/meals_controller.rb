class MealsController < ApplicationController
  def index
    category = Category.find_by(name: params[:category])
    if category
      meals = category.meals
      render json: meals
    else
      render json: { error: 'Category not found' }, status: :not_found
    end
  end
end
