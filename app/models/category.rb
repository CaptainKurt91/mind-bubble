class Category < ApplicationRecord
  include PgSearch::Model
  belongs_to :home
  has_many :tasks
  has_many_attached :photos
  validates :name, presence: true
  
  multisearchable against: :name
end
