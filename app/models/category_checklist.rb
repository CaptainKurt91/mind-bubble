class CategoryChecklist < ApplicationRecord
  belongs_to :category
  
  belongs_to :home, through: :category
  belongs_to :user, through: :home

  has_many :category_checklist_items
end
