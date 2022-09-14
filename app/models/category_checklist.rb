class CategoryChecklist < ApplicationRecord
  include PgSearch::Model
  belongs_to :category

  has_many :category_checklist_items
  multisearchable against: :name
end
