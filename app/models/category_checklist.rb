class CategoryChecklist < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :category
  belongs_to :user

  has_many :category_checklist_items, dependent: :delete_all
  multisearchable against: :name
end
