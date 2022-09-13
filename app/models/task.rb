class Task < ApplicationRecord
  include PgSearch::Model
  belongs_to :category

  has_many :task_notes
  has_many :task_files
  has_many :task_checklists

  validates :name, presence: true

  multisearchable against: :name
end
