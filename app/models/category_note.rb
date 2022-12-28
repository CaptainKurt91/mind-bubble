class CategoryNote < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  multisearchable against: :title
end
