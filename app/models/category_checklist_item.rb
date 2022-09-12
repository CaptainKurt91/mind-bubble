class CategoryChecklistItem < ApplicationRecord
  belongs_to :category_checklist
  
  belongs_to :category, through: :category_checklist
  belongs_to :home, through: :category
  belongs_to :user, through: :home
end
