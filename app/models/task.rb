class Task < ApplicationRecord
  include PgSearch::Model
  belongs_to :category
  belongs_to :user

  has_many :task_notes, dependent: :delete_all
  has_many :task_files, dependent: :delete_all
  has_many :task_checklists, dependent: :delete_all

  validates :name, presence: true

  multisearchable against: :name
end
