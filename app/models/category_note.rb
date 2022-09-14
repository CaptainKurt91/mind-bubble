class CategoryNote < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :category
  multisearchable against: :name
end
