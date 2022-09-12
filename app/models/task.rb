class Task < ApplicationRecord
  include PgSearch::Model
  belongs_to :category
  belongs_to :home, through: :category
  belongs_to :user, through: :home

  has_many :task_notes
  has_many :task_files
  has_many :task_checklists

  validates :name, presence: true

  multisearchable against: :name
end
