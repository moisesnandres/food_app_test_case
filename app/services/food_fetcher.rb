class FoodFetcher
  include HTTParty
  base_uri 'https://www.themealdb.com/api/json/v1/1'

  def fetch_and_store_categories
    response = self.class.get('/categories.php')
    categories = response.parsed_response['categories']

    categories.each do |category|
      Category.find_or_create_by(name: category['strCategory']) do |category_data|
        category_data.description = category['strCategoryDescription']
        category_data.image_url = category['strCategoryThumb']
      end
    end
  end

  def fetch_and_store_meals(category_name)
    category = Category.find_by(name: category_name)
    return unless category

    response = self.class.get("/filter.php?c=#{category_name}")
    meals = response.parsed_response['meals']

    meals.each do |meal|
      price = generate_price(category_name)
      Meal.find_or_create_by(name: meal['strMeal'], category: category) do |meal_data|
        meal_data.image_url = meal['strMealThumb']
        meal_data.price = price
        meal_data.rating = rand(4.0..5.0).round(1)
      end
    end
  end

  private

  def generate_price(category_name)
    case category_name.downcase
    when 'lamb'
      rand(45..100)
    when 'beef'
      rand(35..80)
    when 'pork'
      rand(25..60)
    else
      rand(10..100)
    end
  end
end
