class CategoryNote < ApplicationRecord
  include PgSearch::Model
  belongs_to :category

  multisearchable against: :name
end
