class CategoryChecklist < ApplicationRecord
  include AddStartTime
  belongs_to :category
  has_many :category_checklist_items
end
