class CategoryTask < ApplicationRecord
  belongs_to :category
  belongs_to :task
end
