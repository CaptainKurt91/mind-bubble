class CategoryChecklistItem < ApplicationRecord
  include ChecklistItems
  belongs_to :category_checklist
  belongs_to :user

  validates :title, presence: true
end
