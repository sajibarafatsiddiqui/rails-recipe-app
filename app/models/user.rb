class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  def shopping_list
    # Get the user's food list as a hash list with id as a key and quantity as a value
    user_foods = foods.pluck(:id, :quantity).to_h
    # Get all the recipe_foods from all recipes that belong to the user
    recipe_foods = FoodRecipe.joins(:recipe).where(recipes: { user_id: id }).group(:food_id).sum(:quantity)
    # Calculating the difference in quantity for each food
    difference = {}
    (user_foods.keys + recipe_foods.keys).uniq.each do |food_id|
      difference[food_id] = recipe_foods[food_id].to_i - user_foods[food_id].to_i
    end
    # Get the foods name indexed by id
    foods = Food.where(id: difference.keys).index_by(&:id)
    # Build the result table
    result = []
    difference.each do |food_id, quantity_difference|
      next if quantity_difference <= 0 # Skip foods with a negative or 0 quantity_difference value

      food = foods[food_id]
      result << {
        name: food.name,
        quantity: quantity_difference,
        price: food.price * quantity_difference, # Calculate the price for this food
        measurement_unit: food.measurement_unit
      }
    end
    result
  end
end
