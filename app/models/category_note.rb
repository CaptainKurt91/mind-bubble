class CategoryNote < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :category
  belongs_to :user
  
  multisearchable against: :name
end
