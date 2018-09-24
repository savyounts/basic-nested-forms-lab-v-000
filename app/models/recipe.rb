class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients=(ingredients)
    ingredients.each do |i|
      ingredient = Ingredient.find_or_create_by(name: name)
      self.ingredients << ingredient
    end
  end
end
