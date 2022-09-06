class Category < ApplicationRecord
  belongs_to :home
  has_many :category_tasks
  has_many :tasks, through: :category_tasks
  validates :name, presence: true
end
