class CategoryNote < ApplicationRecord
  belongs_to :category

  belongs_to :home, through: :category
  belongs_to :user, through: :home
end
