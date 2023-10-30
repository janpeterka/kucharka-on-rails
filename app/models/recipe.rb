class Recipe < ActiveRecord
  belongs_to :category, class_name: "RecipeCategory"
  belongs_to :author

  has_many :recipe_labels
  has_many :labels, through: :recipe_labels
  has_many :recipe_tasks
  has_many :tasks, through: :recipe_tasks
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :daily_plan_recipes
  has_many :daily_plans, through: :recipe_daily_plans
  has_many :events, through: :daily_plans

  validates :name, presence: true

  scope :shared, -> { where(is_shared: true) }
  scope :hidden, -> { where(is_hidden: true) }
  scope :visible, -> { where(is_hidden: false) }
  scope :used, -> { joins(:daily_plans).where("daily_plans.id IS NOT NULL").distinct.any? }
  # scope :draft, -> {joins(:ingredients).where.not("ingredients.id IS NULL").distinct.any? }
end
