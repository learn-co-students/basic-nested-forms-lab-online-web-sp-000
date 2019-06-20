class Recipe < ActiveRecord::Base
    has_many :ingredients
    # accepts_nested_attributes_for :ingredients
    # - or -
    def ingredients_attributes=(ingredients)
        ingredients.each do |ingredient|
            # if ingredient.strip != ""
                ing = Ingredient.find_or_create_by(name: ingredient[1]["name"], quantity: ingredient[1]["quantity"])
                # byebug
                # ing = Ingredient.find_or_create_by(ingredients_attributes)
                self.ingredients << ing
            # end
        end
    end

    def ingredients_attributes
        self.ingredients.map do |ingredient|
            "ingredient: #{ingredient.name} - qty: #{ingredient.quantity}"
        end
    end

end
