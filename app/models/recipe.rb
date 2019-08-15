class Recipe < ActiveRecord::Base
  has_many :ingredients

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |f, ingredient_attributes|
      self.ingredients.build(ingredient_attributes)
    end
  end
end
