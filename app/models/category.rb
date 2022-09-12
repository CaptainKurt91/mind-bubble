class Category < ApplicationRecord
  include PgSearch::Model
  belongs_to :home
  belongs_to :user, through: :home

  has_many :tasks
  has_many :category_notes
  has_many :category_files
  has_many :category_checklists

  validates :name, presence: true

  multisearchable against: :name
end
