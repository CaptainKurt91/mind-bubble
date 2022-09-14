class CategoryFile < ApplicationRecord
  belongs_to :category

  has_one :home, through: :category
  has_one :user, through: :home
end
