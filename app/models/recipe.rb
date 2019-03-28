class Recipe < ApplicationRecord
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ingredient, quantity)
    self.ingredient = ingredient.find_or_create_by(name: ingredient.name, quantity: ingredient.quantity)
    self.ingredient.update(ingredient)
  end
end
