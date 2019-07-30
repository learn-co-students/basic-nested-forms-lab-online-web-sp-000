class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  validates :name, :quantity, presence: true
end
