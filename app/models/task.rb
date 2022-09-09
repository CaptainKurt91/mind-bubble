class Task < ApplicationRecord
  include PgSearch::Model
  has_many :components
  belongs_to :category
  validates :name, presence: true
  
  multisearchable against: :name
end
