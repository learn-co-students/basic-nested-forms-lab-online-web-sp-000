class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #gets attribute keys from params hash for person
  def recipe_keys
    all_keys = params[:recipe].keys
    all_keys.collect do |key|
      next if key == "ingredients_attributes"
      key
    end
  end

  def ingredient_keys
    ingredient_attr = params[:recipe]["ingredients_attributes"].values
    ingredient_attr[0].keys
  end

end
