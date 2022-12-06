class CategoryChecklistItem < ApplicationRecord
  belongs_to :category_checklist
  belongs_to :user
end
