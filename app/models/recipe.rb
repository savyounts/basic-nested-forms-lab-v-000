class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ingredients)
    ingredients.each do |i|
      ingred = Ingredient.find_or_create_by(name: i.name)
      self.ingredients << ingred 
    end
  end
end
