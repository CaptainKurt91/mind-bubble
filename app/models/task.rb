class Task < ApplicationRecord
  has_many :category, through: :category_tasks
  validates :name, presence: true
end
