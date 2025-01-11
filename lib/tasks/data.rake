namespace :data do
  desc "Fetch and store categories and meals"
  task fetch: :environment do
    fetcher = FoodFetcher.new
    fetcher.fetch_and_store_categories

    Category.all.each do |category|
      fetcher.fetch_and_store_meals(category.name)
    end
  end
end
