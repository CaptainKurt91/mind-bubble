class Task < ApplicationRecord
  belongs_to :category_task
  belongs_to :category, through: :category_task
  validates :name, presence: true
end
