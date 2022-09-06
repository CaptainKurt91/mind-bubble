class Task < ApplicationRecord
  belongs_to :category_task
  has_many :categories, through :category_task
  validates :name, presence: true
end
