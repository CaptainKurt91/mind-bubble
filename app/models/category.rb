class Category < ApplicationRecord
  include PgSearch::Model
  belongs_to :home

  has_many :tasks, dependent: :delete_all
  has_many :category_notes, dependent: :delete_all
  has_many :category_files, dependent: :delete_all
  has_many :category_checklists, dependent: :delete_all

  validates :name, presence: true

  multisearchable against: :name
end
